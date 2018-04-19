module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter(params)
      params = params.dup
      where_with_operator_support(params)
    end

    def where_with_operator_support(params)
      chain = where(nil)

      params.each do |attribute, value|
        next if value.blank?

        operator = '='
        attribute = attribute.to_s

        if attribute =~ /_lt$/
          operator = '<'
          attribute = attribute.gsub('_lt', '')
        end

        if attribute =~ /_gt$/
          operator = '>'
          attribute = attribute.gsub('_gt', '')
        end

        if attribute =~ /_lte$/
          operator = '<='
          attribute = attribute.gsub('_lte', '')
        end

        if attribute =~ /_gte$/
          operator = '>='
          attribute = attribute.gsub('_gte', '')
        end

        if attribute =~ /_query$/
          operator = 'like'
          value = "%#{sanitize_sql_like(value)}%"
          attribute = attribute.gsub('_query', '')
        end

        next unless attribute_names.include?(attribute)

        chain =
          case operator
          when '='
            chain.where(attribute => value)
          when '<', '>', '<=', '>='
            chain.where("`#{table_name}`.`#{attribute}` #{operator} ?", value)
          when 'like'
            chain.where("`#{table_name}`.`#{attribute}` LIKE ?", value)
          else
            chain.where(nil)
          end
      end

      chain
    end
  end
end
