class PostsController < ApplicationController
    before_action :find_post, only: [:show, :edit, :update, :destroy]
    def index 
        @posts = Post.all
    end
    
    def show
        
    end

    def new
        @destinations = Destination.all
        @bloggers = Blogger.all
        @post = Post.new
    end

    def create
        # byebug
        @post = Post.new(post_params)
        if @post.save
            redirect_to post_path(@post)
        else
            # byebug
            redirect_to new_post_path
        end
    end
     
    def edit
    
    end

    def update
        if @post.update(post_params)
            redirect_to post_path(@post)
        else
            render :edit
        end
    end

    def destroy
        @post.destroy
        redirect_to posts_path
    end

    private

    def find_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :content, :destination_id, :blogger_id)
    end
end
