class CommentsController < ApplicationController
  
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
    
  end

  def create
    @comment = Comment.new
    @comment.user_id = @current_user.id
    @comment.post_id = params[:post_id]
    @comment.comment_content = params[:comment_content]
    if @comment.save 
      flash[:notice] = "コメントを作成しました"
      redirect_to("/posts/#{params[:post_id]}")
    else
      render "new"
    end
    
  end

  def edit
    #@post = Post.find(params[:post_id])
    @comment = Comment.find_by(params[:id])
  end

  def update
    @comment = Comment.new
    @comment.user_id = @current_user.id
    @comment.post_id = params[:post_id]
    @comment.comment_content = params[:comment_content]
    if @comment.save 
      flash[:notice] = "コメントを編集しました"
      redirect_to("/posts/#{params[:post_id]}")
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find_by(params[:id])
    redirect_to("/posts/#{params[:post_id]}")
  end

  
end
