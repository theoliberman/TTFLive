class Team < ApplicationRecord
  scope :today, -> {where team_id: Game.today.map {|g| g[:home_team_id]} + Game.today.map {|g| g[:visitor_team_id]}}

  def players
    Player.where(team_id: self.team_id).order(:score).reverse_order
  end
end
