class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.integer :star, :null => false
      t.text :notes

      t.timestamps
    end
  end
end
