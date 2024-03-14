class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.string :name
      t.integer :coach_id
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps
    end
  end
end
