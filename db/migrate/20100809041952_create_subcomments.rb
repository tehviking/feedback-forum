class CreateSubcomments < ActiveRecord::Migration
  def self.up
    create_table :subcomments do |t|
      t.integer :comment_id
      t.integer :user_id
      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :subcomments
  end
end
