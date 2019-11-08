class CreateParkings < ActiveRecord::Migration[6.0]
  def change
    create_table :parkings do |t|      
      t.string :plate
      t.string :time
      t.boolean :paid
      t.boolean :left
      t.datetime :enter_at
      t.datetime :left_at

      t.timestamps
    end
  end
end
