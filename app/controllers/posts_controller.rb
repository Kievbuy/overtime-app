class PostsController < ApplicationController
    before_action :set_post, only: [:show, :delete, :edit]
    
    def index
        @posts = Post.all
    end
    
    def new
        @post = Post.new
    end
    
    def create
        @post = Post.new(post_data)
        @post.user_id = current_user.id
        
        if @post.save
            redirect_to post_path(@post), notice: 'Post have been sucessfully created'
        else
            render :new
        end
    end
    
    def show
    end
    
    private
    
    def post_data
        params.require(:post).permit(:date, :rationale)
    end
    
    def set_post
        @post = Post.find(params[:id])
    end
    
end
