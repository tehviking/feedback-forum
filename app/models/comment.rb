class Comment < ActiveRecord::Base
  after_create :create_initial_vote
  validates_presence_of :title, :body
  belongs_to :user
  has_many :votes do
    def latest 
      find :all, :order => 'id DESC', :limit => 3
    end
  end
  
  VOTE_LIMIT = 3
    
  def self.popular
    find :all, :order => 'votes_count DESC', :conditions => 'votes_count > 5', :limit => 10
  end
  
# GRRR GRRRR GRRR How do I pass in @comment.id and current_user?????
  def vote_count_by_user(user_id, comment_id)
    Vote.count(:conditions => ["user_id = ? AND comment_id = ?", user_id, comment_id])
  end
  
  def is_votable_by_user?(user_id, comment_id)
    if vote_count_by_user(user_id, comment_id) < VOTE_LIMIT
      return true
    else
      return false
    end
  end
  
  protected
    def create_initial_vote 
      votes.create :user => user
    end 
end
