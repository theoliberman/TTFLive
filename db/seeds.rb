require 'net/http'

players_url = 'http://data.nba.net/prod/v1/2018/players.json'
players_json = JSON.parse(Net::HTTP.get(URI(players_url)))['league']['standard']
players_json.each {|player|
  if player['isActive']
    Player.create(
        player_id: player['personId'],
        name: (player['firstName'] + ' ' + player['lastName']).strip,
        team_id: player['teamId'],
    )
  end
}
