class PostsController < ApplicationController

    def show
      @post = Post.find(params[:id])
      @comment = Comment.new
    end

    def new
      @post = Post.new
    end

    def create
      @new_post = Post.new(posts_params)

      if @new_post.save!
        redirect_to posts_path
      else
        render :index
      end
    end

    def edit
      @post = Post.find(params[:id])
    end

    def update
      @post_to_edit = Post.find(params[:id])
      @post_to_edit.update(posts_params)
      redirect_to @post_to_edit
    end

    def destroy
      @post_to_delete = Post.find(params[:id])
      @post_to_delete.comments.destroy_all
      @post_to_delete.destroy

      render :index
    end

private

    def posts_params
        params.require(:post).permit(:title, :url, :content)
    end

end
