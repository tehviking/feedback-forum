class VotesController < ApplicationController
  def create
    @comment = Comment.find(params[:comment_id])
    @comment.votes.create
    
    respond_to do |format| 
      format.html { redirect_to @story } 
      format.js
    end
  end

end
