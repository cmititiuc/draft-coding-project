class Player < ApplicationRecord
  def average_position_age_diff
    ages = self.class
      .where(position: self.position)
      .map { |player| player.age }
      .compact
    average_age = ages.inject { |sum, age| sum + age }.to_f / ages.size
    (self.age - average_age).round(1) if self.age
  end
end
