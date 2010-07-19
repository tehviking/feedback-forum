require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  test "should show index" do
    get :index
    assert_response :success
    assert_template 'index'
    assert_not_nil assigns(:story)
  end
  
  test "should show new" do
    get :new
    assert_response :success
    assert_template 'new'
    assert_not_nil assigns(:story)
  end
  
  test "should show new form" do
    get :new
    assert_select 'form p', count => 3
  end
  
  test "should add comment" do
    post :create, :comment => {
                  :title => 'test comment', 
                  :body => 'Read Me'
    } 
  assert ! assigns(:comment).new_record? 
  assert_redirected_to comments_path 
  assert_not_nil flash[:notice]
  end
  
  test "should reject missing comment attribute" do
    post :create, :comment => {
                  :title => 'test comment', 
    } 
  assert assigns(:comment).errors_on(:body)
  end
end
