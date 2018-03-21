class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :type
      t.string :first_name
      t.string :last_name
      t.string :position
      t.integer :age

      t.timestamps
    end
  end
end
