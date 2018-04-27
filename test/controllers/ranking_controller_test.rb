require 'test_helper'

class RankingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ranking_index_url
    assert_response :success
  end

  test "should get game" do
    get ranking_game_url
    assert_response :success
  end

  test "should get match" do
    get ranking_match_url
    assert_response :success
  end

end
