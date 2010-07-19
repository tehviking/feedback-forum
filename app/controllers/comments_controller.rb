class CommentsController < ApplicationController
  before_filter :login_required, :only => [ :new, :create ]
  
  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.build params[:comment]
    if @comment.save
      flash[:notice] = 'Sweet! Your feedback was submitted successfully.'
      redirect_to(@comment)
    else
      render :action => "new"
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      flash[:notice] = 'Comment was successfully updated.'
    else
      render :action => "edit"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to(comments_url)
  end

  def popular
    @popular = Comment.popular
  end

end
