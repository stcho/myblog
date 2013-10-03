class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :tags, dependent: :destroy
  # belongs_to :tags
  validates :title, presence: true, length: { minimum: 5 }
end
