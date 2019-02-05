class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :team_id
      t.string :name
      t.string :code

      t.timestamps
    end
  end
end
