class AddArticleTagsToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :article_tags, :string
  end
end
