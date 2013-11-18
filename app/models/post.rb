class Post < ActiveRecord::Base
	attr_accessible :body, :title, :topic, :text
	has_many :comments
	has_many :votes, dependent: :destroy
  belongs_to :user
  belongs_to :topic

  default_scope order('created_at DESC')


  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true
  validates :user, presence: true 

#see only up or down votes
#mount_uploader :image, ImageUploader

  def up_votes
    self.votes.where(value: 1).count
  end

  def down_votes
    self.votes.where(value: -1).count
  end  

   def points
    self.votes.sum(:value).to_i
  end  
end


