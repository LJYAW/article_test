class AddIsSubmitToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :is_submit, :boolean
  end
end
