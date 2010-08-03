class AddVotesLeftToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :votes_left, :integer
  end

  def self.down
    remove_column :users, :votes_left
  end
end
