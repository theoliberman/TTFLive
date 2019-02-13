class PagesController < ApplicationController
  def home
    @players = Player.today.order(:score).reverse_order
    if session[:players].nil?
      @dashboard_players = nil
    else
      @dashboard_players = @players.select {|p| session[:players].include? p.player_id}
    end
    @games = Game.today
  end
end
