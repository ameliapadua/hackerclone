class CommentsController < ApplicationController

    def create
      @post = Post.find(params[:post_id])
      @new_comment = Comment.new(comment_params.merge(post: @post, user: current_user))

      if @new_comment.save!
        redirect_to @post
      else
        render :new
      end
    end

    def edit
      @comment = Comment.find(params[:id])
    end

    def update
      @comment_to_edit = Comment.find(params[:id])
      @comment_to_edit.update(comment_params)
      redirect_to @post
    end

    def destroy
      Comment.destroy(params[:id])
      redirect_to @post
    end

private

    def comment_params
        params.require(:comment).permit(:content)
    end

end
