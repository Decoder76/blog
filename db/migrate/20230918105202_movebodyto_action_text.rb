class MovebodytoActionText < ActiveRecord::Migration[7.0]
  def change
    Article.all.find_each do |article|
      article.update(content: article.body)
    end
  end
end
