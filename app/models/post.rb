class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :post_tags
  has_many :tags, through: :post_tags, dependent: :destroy #dependent destroy works for post_tags but not working for tags. Why is that?
  validates :title, presence: true, length: { minimum: 5 }
end
