class Post < ActiveRecord::Base
	attr_accessible :body, :titlehas_many :comments
  belongs_to :user

  default_scope order('created_at DESC')

end
