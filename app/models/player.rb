class Player < ApplicationRecord

  scope :today, -> {where team_id: Team.today.map {|t| t[:team_id]}}

  def team
    Team.find_by_team_id(self.team_id)
  end

  def rank
    Player.where('score > ?', self.score).count + 1
  end

end
