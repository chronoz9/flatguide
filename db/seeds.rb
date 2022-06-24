# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

f = Flat.new(name: 'Modern Family', latitude: -8.6447444795, longitude: 115.13571553 )
f.save(validate: false)#canggu
f.users.create(name: 'Claire', email: 'claire@modern.com')
f.users.create(name: 'Phillip', email: 'phillip@modern.com')
f.users.create(name: 'Luke', email: 'luke@modern.com')

d = Flat.new(name: 'Prichet Estate', latitude: -8.6430478102, longitude: 115.131743540)
d.save(validate: false)#canggu
d.users.create(name: 'Manny', email: 'manny@prichet.com')
d.users.create(name: 'Gloria', email: 'gloria@prichet.com')
d.users.create(name: 'Jay', email: 'jay@prichet.com')

t = Flat.new(name: 'Tucker Barn', latitude: -8.704380521, longitude: 115.189391793)
t.save(validate: false)
t.users.create(name: 'Lily', email: 'lily@tucker.com')
t.users.create(name: 'Cameron', email: 'cameron@tucker.com')

Neighborhood.new(name: 'Canggu', latitude: -8.6464004379, longitude: 115.138385080, radius: 0.7).save(validate: false)
Neighborhood.new(name: 'Kedonganan', latitude:-8.7586213161, longitude: 115.173604470, radius: 2).save(validate: false)
