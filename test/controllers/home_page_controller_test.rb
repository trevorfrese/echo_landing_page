require 'test_helper'

class HomePageControllerTest < ActionController::TestCase
  test "should get interested_users_home" do
    get :interested_users_home
    assert_response :success
  end

end
