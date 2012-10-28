require 'test_helper'

class CategoryControllerTest < ActionController::TestCase
  test "should get book" do
    get :book
    assert_response :success
  end

  test "should get phone" do
    get :phone
    assert_response :success
  end

  test "should get computer" do
    get :computer
    assert_response :success
  end

end
