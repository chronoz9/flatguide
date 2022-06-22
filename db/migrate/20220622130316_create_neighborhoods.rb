class CreateNeighborhoods < ActiveRecord::Migration[7.0]
  def change
    create_table :neighborhoods do |t|
      t.string :name
      t.decimal :latitude, precision: 15, scale: 10
      t.decimal :longitude, precision: 15, scale: 10
      t.integer :radius

      t.timestamps
    end
  end
end
