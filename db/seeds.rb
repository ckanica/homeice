# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'csv'

rinks_raw = File.read('rinks.csv')
csv = CSV.parse(rinks_raw, headers: true)

csv.each do |row|
    rink = Rink.create!(name: row['Name'],
                 address: row['Address'],
                 rink_type: row['Rink Type'],
                 ottawa_rinks_ref: row['rinkid'])

    Message.create!(body: "#{row['rinkid']}0",
                    phone: "16137089",
                    rink: rink,
                    condition: 0)
end
