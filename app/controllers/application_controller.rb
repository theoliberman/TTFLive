class ApplicationController < ActionController::Base

  def update_score
    reset_all_score
    Game.today.each {|game|
      url = 'http://data.nba.net/v2015/json/mobile_teams/nba/2018/scores/gamedetail/'
      url += game[:game_id] + '_gamedetail.json'
      gamedetail = JSON.parse(Net::HTTP.get(URI(url)))['g']
      unless gamedetail['vls']['pstsg'].nil? || gamedetail['hls']['pstsg'].nil?
        game.players.each {|player|
          stats = (gamedetail['vls']['pstsg'] + gamedetail['hls']['pstsg']).find do |p|
            p['pid'].to_s == player[:player_id]
          end
          unless stats.nil?
            score = calculate_score(stats)
            unless score == player.score
              player.update(score: score)
            end
          end
        }
      end
    }
    redirect_to root_path
    #ActionCable.server.broadcast('score', nil)
  end

  def reset_all_score
    Player.all.update(score: 0)
  end

  def calculate_score(stats)
    pts = stats['pts'].to_i
    reb = stats['reb'].to_i
    ast = stats['ast'].to_i
    stl = stats['stl'].to_i
    blk = stats['blk'].to_i
    fgm = stats['fgm'].to_i
    fga = stats['fga'].to_i
    tpm = stats['tpm'].to_i
    tpa = stats['tpa'].to_i
    ftm = stats['ftm'].to_i
    fta = stats['fta'].to_i
    tov = stats['tov'].to_i
    pts + reb + ast + stl + blk + 2 * fgm + 2 * tpm + 2 * ftm - tov - fga - tpa - fta
  end

end
