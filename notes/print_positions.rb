require 'net/http'
require 'json'


['football', 'baseball', 'basketball'].each { |sport|
  results = Net::HTTP.get(
    'api.cbssports.com',
    "/fantasy/players/list?version=3.0&SPORT=#{sport}&response_format=JSON"
  )

  json_results = JSON.parse(results)

  players = json_results['body']['players']

  puts "#{sport} Player Positions"

  puts players.map { |p| p['position'] }.uniq.join(', ')
}

# football Player Positions
# TQB, D, ST, DST, DB, WR, DL, RB, LB, K, QB, TE, C, , P
# baseball Player Positions
# PS, RP, SP, 1B, SS, RF, C, CF, LF, 3B, P, 2B, OF, DH
# basketball Player Positions
# SG, SF, C, PF, PG, , G
