require 'test_helper'

class PlayersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @player = players(:two)
  end

  teardown do
    Rails.cache.clear
  end

  test "should get football players" do
    get players_football_url
    assert_response :success
  end

  test "should get basketball players" do
    get players_basketball_url
    assert_response :success
  end

  test "should get baseball players" do
    get players_baseball_url
    assert_response :success
  end

  test "should get a player" do
    get player_url(@player)
    assert_response :success
  end
end
