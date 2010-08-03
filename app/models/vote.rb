class Vote < ActiveRecord::Base
  belongs_to :comment, :counter_cache => true
  belongs_to :user
     
end
