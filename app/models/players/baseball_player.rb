class BaseballPlayer < Player
  def name_brief
    "#{first_name.first}. #{last_name.first}."
  end
end
