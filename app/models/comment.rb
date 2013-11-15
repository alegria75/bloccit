class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  attr_accessible :body, :user_id, :post_id

  validates :body, length: { minimum: 5 }, presence: true

  validates :user, presence: true 
end
