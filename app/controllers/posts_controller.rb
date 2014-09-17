class PostsController < ApplicationController
  before_action :set_post, :only=> [:update, :destroy]


  def index
    @posts = Post.eager_load(:comments).order("posts.id DESC")
    @post = Post.new
    @comment = Comment.new

  end




  def create
    @post = Post.new(post_params)
    @comment = Comment.new
    respond_to do |format|
      if @post.save
        format.js { render :create }
      else
        format.js { render :error }
      end
    end
  end


  def update
    respond_to do |format|
      if @post.update(post_params)
        format.js { render :update }
      else
        format.js { render :error }
      end
    end
  end


  def destroy
    @post.destroy
    respond_to do |format|
      format.js { render :destroy }
    end
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end


    def post_params
      params.require(:post).permit(:content, :title,:photos)
    end

end
