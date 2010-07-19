class Comment < ActiveRecord::Base
  validates_presence_of :title, :body
  belongs_to :user
  has_many :votes do
    def latest 
      find :all, :order => 'id DESC', :limit => 3
    end
  end
  
  def self.popular
    find :all, :order => 'votes_count DESC', :conditions => 'votes_count > 5', :limit => 10
  end
end
