# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'net/http'
require 'json'

['football', 'baseball', 'basketball'].each { |sport|
  puts "\nImporting #{sport} players...\n"

  path = "/fantasy/players/list?version=3.0&SPORT=#{sport}&response_format=JSON"
  response = Net::HTTP.get('api.cbssports.com', path)
  players  = JSON.parse(response)['body']['players']

  puts "Persisting #{sport} players...\n"

  players.each_with_index { |player, index|
    Player.create(
      first_name: player['firstname'],
      last_name:  player['lastname'],
      position:   player['position'],
      age:        player['age'],
      type:       "#{sport.titleize}Player"
    )

    printf("\rProgress: #{index + 1}/#{players.count}")
  }
  puts
}

puts "\nDone\n\n"
