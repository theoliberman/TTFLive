require 'net/http'

teams_url = 'http://data.nba.net/prod/v1/2018/teams.json'
teams_json = JSON.parse(Net::HTTP.get(URI(teams_url)))['league']['standard']
teams_json.each {|team|
  if team['isNBAFranchise']
    Team.create(team_id: team['teamId'], name: team['fullName'], code: team['tricode'])
  end
}

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
