class CreateCoachAvailabilities < ActiveRecord::Migration[7.1]
  def change
    create_table :coach_availabilities do |t|
      t.integer :coach_id
      t.string :timezone
      t.string :day_of_week
      t.time :start_at
      t.time :end_at

      t.timestamps
    end
  end
end
