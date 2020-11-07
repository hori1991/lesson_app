class CommentsController < ApplicationController
  
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
    
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = @current_user.id
    #@comment.post_id = params[:post_id]
    #@comment.comment_content = params[:comment_content]
    if @comment.save 
      flash[:notice] = "コメントを作成しました"
      redirect_to("/posts/#{params[:post_id]}")
    else
      render "new"
    end
    
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.user_id = @current_user.id
    #@comment.post_id = params[:post_id]
    #@comment.comment_content = params[:comment_content]
    if #@comment.save
      @comment.update(comment_params)
      flash[:notice] = "コメントを編集しました"
      redirect_to("/posts/#{params[:post_id]}")
    else
      render "edit"
    end
  end

  

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    flash[:notice] = "コメントを削除しました"
    redirect_to("/posts/#{params[:post_id]}")
  end

  private
  def comment_params
    params.permit(:post_id, :comment_content)
  end
  
end
