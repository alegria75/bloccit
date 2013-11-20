class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  attr_accessible :value, :post

 	validates :value, inclusion: { in: [-1, 1], message: "%{value} is not a valid vote." }
 	after_save :update_post

  def up_vote?
    value == 1
  end

  def down_vote?
    value == -1
  end


 	private #below are private methodss

 	def update_post
 		self.post.update_rank
	end

end
