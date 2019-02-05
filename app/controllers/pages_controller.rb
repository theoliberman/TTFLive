class PagesController < ApplicationController
  def home
    @players = Player.today.order(:score).reverse_order
    @games = Game.today
  end
end
