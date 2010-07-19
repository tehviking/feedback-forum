class UsersController < ApplicationController
  def show
    @user = User.find(params[:id]) 
    @comments_submitted = @user.comments.find(:all,
        :limit => 6, :order => 'comments.id DESC') 
    @comments_voted_on = @user.comments_voted_on.find(:all,
        :limit => 6, :order => 'votes.id DESC').uniq!
  end
end
