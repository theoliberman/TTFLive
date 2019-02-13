require 'test_helper'

class GamesControllerTest < ActionDispatch::IntegrationTest
  test "should get today" do
    get games_today_url
    assert_response :success
  end

end
