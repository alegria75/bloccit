class CommentsController < ApplicationController
	def create
	 @post = Post.find(params[:post_id])
	 @topic = @post.topic
	 @comment = @post.comments.build(params[:comment])
	 @comment.user_id = current_user.id
	 if @comment.save
	 	redirect_to [@topic, @post], notice:"Comment created."
	 else
	 	redirect_to [@topic, @post], error: "Could not save comment."
	 end
	end

		def destroy
		@topic = Topic.find(params[:topic_id]) # change get topic from post
				@post = @topic.posts.find(params[:post_id]) #change

				@comment = @post.comments.find(params[:id])

				authorize! :destroy, @comment, message: "You need to own the comment to delete it."
				if @comment.destroy
						flash[:notice] = "Comment was removed"
						redirect_to [@topic, @post]
				else
						flash[:error] = "Comment couldn't be deleted. Try again."
						redirect_to [@topic, @post]
				end
		end

		

		# def comment_params
		# 		params.require(:comment).permit(:commenter, :body, :post_id)
		# end

end