class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :post_tags
  has_many :tags, through: :post_tags, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5 }
end
