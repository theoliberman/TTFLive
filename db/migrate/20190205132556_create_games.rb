class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :game_id
      t.string :date
      t.string :home_team_id
      t.string :visitor_team_id

      t.timestamps
    end
  end
end
