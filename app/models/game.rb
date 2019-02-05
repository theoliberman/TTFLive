class Game < ApplicationRecord
  todays_date = Time.now.in_time_zone('Pacific Time (US & Canada)').strftime('%Y%m%d')
  scope :today, -> {where date: todays_date}

  def home_team
    Team.find_by_team_id(self.home_team_id)
  end

  def visitor_team
    Team.find_by_team_id(self.visitor_team_id)
  end

  def players
    home_team.players + visitor_team.players
  end

end
