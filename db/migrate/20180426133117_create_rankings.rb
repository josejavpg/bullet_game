class CreateRankings < ActiveRecord::Migration[5.1]
  def change
    create_table :rankings do |t|
      t.string :nickname
      t.integer :points

      t.timestamps
    end
  end
end
