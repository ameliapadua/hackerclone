class CommentsController < ApplicationController

    def create
      if current_user
        @post = Post.find(params[:post_id])
        @new_comment = Comment.new(comment_params.merge(post: @post, user: current_user))

        if @new_comment.save!
          redirect_to @post
        else
          render :new
        end
      else
        redirect_to root_path
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
      comment = Comment.find(params[:id])
      if comment.user.id == current_user.id
        comment.destroy
      end
      redirect_to comment.post
    end

private

    def comment_params
        params.require(:comment).permit(:content)
    end

end
