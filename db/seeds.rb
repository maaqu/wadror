# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

b1 = Brewery.create name:"Koff", year:1897
b2 = Brewery.create name:"Malmgard", year:2001
b3 = Brewery.create name:"Weihenstephaner", year:1042
b4 = Brewery.create name:"BrewDog", year:2007

b1.beers.create name:"Iso 3", style:"Lager"
b1.beers.create name:"Karhu", style:"Lager"
b1.beers.create name:"Tuplahumala", style:"Lager"
b2.beers.create name:"Huvila Pale Ale", style:"Pale Ale"
b2.beers.create name:"X Porter", style:"Porter"
b3.beers.create name:"Hefezeizen", style:"Weizen"
b3.beers.create name:"Helles", style:"Lager"
b4.beers.create name:"Punk IPA", style:"IPA"
b4.beers.create name:"Nanny State", style:"lowalcohol"

o1 = Beer.find_by(name:"Iso 3")
o2 = Beer.find_by(name:"Karhu")
o3 = Beer.find_by(name:"Nanny State")

o1.ratings.create score:20
o1.ratings.create score:35
o2.ratings.create score:17
o3.ratings.create score:52
o3.ratings.create score:67
o3.ratings.create score:12
o3.ratings.create score:33


