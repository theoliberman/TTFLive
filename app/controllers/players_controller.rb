class PlayersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:refresh]

  def refresh
    all_players = Player.today.order(:score).reverse_order
    if params[:input].present?
      @players = all_players.where('name LIKE ?', '%' + params[:input] + '%')
    else
      @players = all_players
    end
    respond_to do |format|
      format.js
    end
  end

end
