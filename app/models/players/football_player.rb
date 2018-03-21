class FootballPlayer < Player
  def name_brief
    "#{first_name.first}. #{last_name}"
  end
end
