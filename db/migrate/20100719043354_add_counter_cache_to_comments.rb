class AddCounterCacheToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :votes_count, :integer, :default => 0
    Comment.find(:all).each do |s|
      s.update_attribute :votes_count, s.votes.length 
    end
  end

  def self.down
    remove_column :comments, :votes_count
  end
end
