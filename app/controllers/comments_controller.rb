class CommentsController < ApplicationController
  

  def index
    @comments = Comment.all
    @comment = Comment.new
  end



  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.js { render :create }
      else
        format.js { render :error }
      end
    end
  end


  def update

    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update(comment_params)
        format.js { render :update }
      else
        format.js { render :error }
      end
    end
  end


  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.js { render :destroy }
    end
  end

  private



    def comment_params
      params.require(:comment).permit(:content,:post_id)
    end

end
