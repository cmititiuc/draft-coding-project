require 'test_helper'
require 'json'

class ApiTest < ActionDispatch::IntegrationTest
  teardown do
    Rails.cache.clear
  end

  test "should get football players" do
    get players_football_url
    results = JSON.parse(response.body).map { |p| p["name_brief"] }.sort

    assert_equal(results.count, FootballPlayer.count)
    assert_equal(results, FootballPlayer.all.map { |p| p.name_brief }.sort)
  end

  test "should get basketball players" do
    get players_basketball_url
    results = JSON.parse(response.body).map { |p| p["name_brief"] }.sort

    assert_equal(results.count, BasketballPlayer.count)
    assert_equal(results, BasketballPlayer.all.map { |p| p.name_brief }.sort)
  end

  test "should get baseball players" do
    get players_baseball_url
    results = JSON.parse(response.body).map { |p| p["name_brief"] }.sort

    assert_equal(results.count, BaseballPlayer.count)
    assert_equal(results, BaseballPlayer.all.map { |p| p.name_brief }.sort)
  end

  test "should get a football player" do
    expected_result = {
      "name_brief"=>"D. Vader",
      "first_name"=>"Darth",
      "last_name"=>"Vader",
      "position"=>"Sith Lord",
      "age"=>45,
      "average_position_age_diff"=>-44.0
    }
    get player_url(players(:two))

    assert_equal(JSON.parse(response.body).except("id"), expected_result)
  end

  test "should get a basketball player" do
    expected_result = {
      "name_brief"=>"Bruce W.",
      "first_name"=>"Bruce",
      "last_name"=>"Wayne",
      "position"=>"Superhero",
      "age"=>42,
      "average_position_age_diff"=>4.7
    }
    get player_url(players(:nine))

    assert_equal(JSON.parse(response.body).except("id"), expected_result)
  end

  test "should get a baseball player" do
    expected_result = {
      "name_brief"=>"M. T.",
      "first_name"=>"Matt",
      "last_name"=>"Trakker",
      "position"=>"MASK",
      "age"=>41,
      "average_position_age_diff"=>6.7
    }
    get player_url(players(:sixteen))

    assert_equal(JSON.parse(response.body).except("id"), expected_result)
  end
end
