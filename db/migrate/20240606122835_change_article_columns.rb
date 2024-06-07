class ChangeArticleColumns < ActiveRecord::Migration[6.1]
  def change
    change_column :articles, :title, :string, limit: 10, null: false
    change_column :articles, :content, :text, null: false
  end
end