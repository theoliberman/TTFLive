class CreateAppstates < ActiveRecord::Migration[5.2]
  def change
    create_table :appstates do |t|
      t.boolean :auto_update

      t.timestamps
    end
  end
end
