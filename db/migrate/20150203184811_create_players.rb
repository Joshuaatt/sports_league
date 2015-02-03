class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.column :player_name, :string
      t.timestamps
    end
  end
end
