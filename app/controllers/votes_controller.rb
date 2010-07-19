class VotesController < ApplicationController
  before_filter :login_required
  
  def create
    @comment = Comment.find(params[:comment_id])
    @comment.votes.create(:user => current_user)
    
    respond_to do |format| 
      format.html { redirect_to @story } 
      format.js
    end
  end

end
