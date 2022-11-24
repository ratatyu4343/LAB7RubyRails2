class CreateHouses < ActiveRecord::Migration[7.0]
  def change
    create_table :houses do |t|
      t.integer :number
      t.integer :street_id
      t.timestamps
    end
  end
end
