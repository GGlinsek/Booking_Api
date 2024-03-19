# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'csv'

CoachAvailability.delete_all

CSV.foreach(Rails.root.join('db', 'coach_availabilities.csv'), headers: true) do |row|
  coach_name = row['Name']
  timezone = row['Timezone']
  day_of_week = row['Day of Week']
  timezone = timezone.split(") ")[1]
  available_at = Time.parse(row['Available at'])
  available_until = Time.parse(row['Available until'])


  coach = Coach.find_or_create_by(name: coach_name)

  available_at = Time.new.in_time_zone(timezone).change(hour: available_at.hour, min: available_at.min)
  available_until = Time.new.in_time_zone(timezone).change(hour: available_until.hour, min: available_until.min)

  coach.coach_availabilities.create(timezone: timezone, day_of_week: day_of_week, start_at: available_at, end_at: available_until)
end


