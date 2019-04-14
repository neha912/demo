require 'test_helper'

class FriendshippsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get friendshipps_create_url
    assert_response :success
  end

  test "should get update" do
    get friendshipps_update_url
    assert_response :success
  end

  test "should get destroy" do
    get friendshipps_destroy_url
    assert_response :success
  end

end
