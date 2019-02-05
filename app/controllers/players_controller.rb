class PlayersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:refresh]

  def add
    respond_to do |format|
      if session[:players].nil?
        session[:players] = [params[:player_id]]
        format.html {redirect_to root_url, notice: 'Player was successfully add'}
      else
        if session[:players].include? params[:player_id]
          format.html {redirect_to root_url, notice: 'Player was already add'}
        else
          session[:players].append params[:player_id]
          format.html {redirect_to root_url, notice: 'Player was successfully add'}
        end
      end
    end
  end

  def delete
    respond_to do |format|
      session[:players].delete(params[:player_id])
      format.html {redirect_to root_url, notice: 'Player was successfully deleted'}
    end
  end

  def reset
    respond_to do |format|
      session.delete(:players)
      format.html {redirect_to root_url, notice: 'Players were successfully reset'}
    end
  end

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
