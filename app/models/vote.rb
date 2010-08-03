class Vote < ActiveRecord::Base
  belongs_to :comment, :counter_cache => true
  belongs_to :user
  validate_on_create :is_votable_by_user, :message => "You've reached your voting limit for this comment."
  
  VOTE_LIMIT = 3
  
  def vote_count_by_user
    Vote.count(:conditions => ["user_id = ? AND comment_id = ?", self.user.id, self.comment.id])
  end
  
   def is_votable_by_user
     errors.add("User vote limit reached.") unless self.vote_count_by_user < VOTE_LIMIT
   end
     
end
