# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Flat.destroy_all
User.destroy_all


user = User.create( first_name:'maxence', last_name:'snoy', email: 'maxence.snoy@gmail.com', password: "xxxxxxxx", created_at: Time.now,
  updated_at: Time.now)

Flat.create( city:'Ouagadougou', address:'1, Bd Ratag  Rima', capacity: (2..5).to_a.sample , price: (1..10).to_a.sample,
  user_id: user.id, pics: ['hut1'], title: "Hut for sun protection", description: Faker::Lorem.paragraph)
Flat.create( city:'Ouagadougou', address:'2, Bd Ratag  Rima', capacity: (2..5).to_a.sample, price: (1..10).to_a.sample,
 user_id:  user.id, pics: ['hut2'], title: "Chilly chillax hut", description: Faker::Lorem.paragraph)
Flat.create( city:'Ouagadougou', address:'3, Bd Ratag  Rima', capacity: (2..5).to_a.sample, price: (1..10).to_a.sample,
  user_id:  user.id, pics: ['hut3'], title: "Awesome hut", description: Faker::Lorem.paragraph)

user = User.create( first_name:'xam', last_name:'owning', email: 'xam.owning@gmail.com', password: "xxxxxxxx", created_at: Time.now,
  updated_at: Time.now)

Flat.create( city:'New York', address:'4, main street', capacity: (2..5).to_a.sample, price: (1..10).to_a.sample,
 user_id:  user.id, pics: ['hut4'], title: "Awesome hut", description: Faker::Lorem.paragraph)
Flat.create( city:'New York', address:'5, main street', capacity: (2..5).to_a.sample, price: (1..10).to_a.sample,
  user_id:  user.id, pics: ['hut5'], title: "Hippie hut", description: Faker::Lorem.paragraph)
Flat.create( city:'New York', address:'6, main street', capacity: (2..5).to_a.sample, price: (1..10).to_a.sample,
  user_id:  user.id, pics: ['hut6'], title: "Master bong hut", description: Faker::Lorem.paragraph)


