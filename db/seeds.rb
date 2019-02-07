require 'net/http'

if Appstate.first.nil?
  Appstate.create(auto_update: false)
else
  Appstate.first.update(auto_update: false)
end

teams_url = 'http://data.nba.net/prod/v1/2018/teams.json'
teams_json = JSON.parse(Net::HTTP.get(URI(teams_url)))['league']['standard']
teams_json.each {|team|
  if team['isNBAFranchise']
    Team.create(team_id: team['teamId'], name: team['fullName'], code: team['tricode'])
  end
}

games_url = 'http://data.nba.net/prod/v2/2018/schedule.json'
games_json = JSON.parse(Net::HTTP.get(URI(games_url)))['league']['standard']
games_json.each {|game|
  if game['seasonStageId'] == 2
    Game.create(
        game_id: game['gameId'],
        date: game['startDateEastern'],
        home_team_id: game['hTeam']['teamId'],
        visitor_team_id: game['vTeam']['teamId']
    )
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
