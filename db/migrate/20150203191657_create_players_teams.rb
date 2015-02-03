class CreatePlayersTeams < ActiveRecord::Migration
  def change
    create_table :players_teams do |t|
      t.column :player_id, :integer
      t.column :team_id, :integer
      t.timestamps
    end
  end
end
