class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #User has many posts and comments  
  has_many :posts
  has_many :comments
  
  def name 
    return first_name + ' ' + last_name
  end 
end
