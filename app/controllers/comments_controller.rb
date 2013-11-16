class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)
        redirect_to post_path(@post)
    end

    def destroy
        @topic = Topic.find(params[:topic_id])
        @post = @topic.posts.find(params[:post_id])

        @comment = @post.comments.find(params[:id])

        authorize! :destroy, @comment, message: "You need to own the comment to delete it."
        if @comment.destroy
            flash[:notice] = "Comment was removed."
            redirect_to [@topic, @post]
        else
            flash[:error] = "Comment couldn't be deleted. Try again."
        redirect_to [@topic, @post]
        end
  end
    private

    def comment_params
      params.require(:comment).permit(:commenter, :body, :post_id)
    end
end

