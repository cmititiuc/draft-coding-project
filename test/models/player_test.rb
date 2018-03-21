require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  teardown do
    Rails.cache.clear
  end

  test "should calculate average position age differential" do
    age = 27
    average_age_for_position = (99 + 123 + 45 + age.to_f) / 4
    expected_result = age - average_age_for_position
    player = FootballPlayer.create(
      first_name: 'Darth',
      last_name: 'Maul',
      position: 'Sith Lord',
      age: age
    )

    assert_equal(player.average_position_age_diff, expected_result)
  end
end
