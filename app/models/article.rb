class Article < ApplicationRecord
  has_many :comments, dependent: :delete_all
  has_rich_text :content
  validates :title, presence: true
  max_paginates_per 50
end

