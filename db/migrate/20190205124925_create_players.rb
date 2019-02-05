class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :player_id
      t.string :name
      t.string :team_id
      t.integer :score, default: 0

      t.timestamps
    end
  end
end
