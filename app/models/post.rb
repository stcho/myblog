class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :tags
  validates :title, presence: true, length: { minimum: 10 }
end
