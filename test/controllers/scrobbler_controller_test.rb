require 'test_helper'

class ScrobblerControllerTest < ActionController::TestCase
  test "should get scrobble" do
    get :scrobble
    assert_response :success
  end

end
