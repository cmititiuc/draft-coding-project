class Player < ApplicationRecord
  def average_position_age_diff
    (self.age - average_age).round(1) if self.age
  end

  private

  def average_age
    Rails.cache.fetch("#{self.type}/#{self.position}", expires_in: 1.minute) do
      ages = self.class
        .where(position: self.position)
        .map { |player| player.age }
        .compact
      ages.inject { |sum, age| sum + age }.to_f / ages.size
    end
  end
end
