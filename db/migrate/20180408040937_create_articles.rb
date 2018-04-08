class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :short_title
      t.string :keywords
      t.string :description
      t.string :content

      t.timestamps
    end
  end
end
