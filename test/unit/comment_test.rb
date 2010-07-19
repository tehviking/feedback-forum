require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "should not be valid without name" do
    c = Comment.create(:title => nil, :body => 'sweet mutha')
  assert c.errors.on(:title)
  end
  
  test "should not be valid without body" do
    c = Comment.create(:title => 'what the', :body => nil)
  assert c.errors.on(:body)
  end
  
  test "should be valid with title and body" do
    c = Comment.create(:title => 'what the', :body => 'sweet mutha')
  assert c.valid?
  end
end
