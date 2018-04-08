class AddIsChooseToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :is_choose, :boolean
  end
end
