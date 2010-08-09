class User < ActiveRecord::Base
  after_create :fill_votes_left
  has_many :comments
  has_many :votes
  has_many :subcomments
  has_many :comments_voted_on,
      :through => :votes, :source => :comment
      
  # Include default devise modules. Others available are:
  # :http_authenticatable, :token_authenticatable, :confirmable, :lockable, :timeoutable and :activatable
  devise :registerable, :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation
  
  def decrement_votes_left
    self.votes_left -= 1
    self.save
  end

  protected  
    def fill_votes_left
      self.votes_left = 10
      self.save
    end
end
