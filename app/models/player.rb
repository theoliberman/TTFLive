class Player < ApplicationRecord

  def team
    Team.find_by_team_id(self.team_id)
  end

end
