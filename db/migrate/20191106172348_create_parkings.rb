class CreateParkings < ActiveRecord::Migration[6.0]
  def change
    create_table :parkings do |t|
      t.string :plate, null: false      
      t.boolean :paid, null: false, default: false
      t.boolean :left, null: false, default: false
      t.datetime :enter_at, null: false
      t.datetime :left_at

      t.timestamps
    end
  end
end
