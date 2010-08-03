class Comment < ActiveRecord::Base
  after_create :create_initial_vote
  validates_presence_of :title, :body
  belongs_to :user
  has_many :votes do
    def latest 
      find :all, :order => 'id DESC', :limit => 3
    end
  end
# THIS SHOULD NOT BE HERE. Everything related to vote_count_by_user is duplicated in the Vote model.
  VOTE_LIMIT = 3
      
  def self.popular
    find :all, :order => 'votes_count DESC', :conditions => 'votes_count > 5', :limit => 10
  end
 
  def times_voted_by_user
    Vote.count(:conditions => ["user_id = ? AND comment_id = ?", self.user.id, self.id])
  end
  
  def user_can_vote?
    if times_voted_by_user < VOTE_LIMIT
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
