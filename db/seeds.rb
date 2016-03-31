# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Unavailability.destroy_all
Flat.destroy_all
User.destroy_all



user = User.create( first_name:'maxence', last_name:'snoy', email: 'maxence.snoy@gmail.com', password: "xxxxxxxx", created_at: Time.now,
  updated_at: Time.now)

Flat.create( city:'Bruxelles', address:'101, rue de la loi', capacity: (2..5).to_a.sample , price: (1..10).to_a.sample,
  user_id: user.id, title: "Hut for sun protection", description: Faker::Lorem.paragraph)
Flat.create( city:'Bruxelles', address:'102, rue de la loi, Bd Ratag  Rima', capacity: (2..5).to_a.sample, price: (1..10).to_a.sample,
 user_id:  user.id, title: "Chilly chillax hut", description: Faker::Lorem.paragraph)
Flat.create( city:'Bruxelles', address:'103, rue de la loi', capacity: (2..5).to_a.sample, price: (1..10).to_a.sample,
  user_id:  user.id, title: "Awesome hut", description: Faker::Lorem.paragraph)
flat = Flat.create( city:'Chicago', address:'11, main street', capacity: (2..5).to_a.sample, price: (1..10).to_a.sample,
 user_id:  user.id,  title: "Awesome hut", description: Faker::Lorem.paragraph)
Unavailability.create(start_date:"2016-04-01", end_date:"2016-04-10", flat_id: flat.id)

flat = Flat.create( city:'Chicago', address:'12, main street', capacity: (2..5).to_a.sample, price: (1..10).to_a.sample,
  user_id:  user.id, title: "Hippie hut", description: Faker::Lorem.paragraph)
Unavailability.create(start_date:"2016-04-11", end_date:"2016-04-20", flat_id: flat.id)

flat = Flat.create( city:'Chicago', address:'13, main street', capacity: (2..5).to_a.sample, price: (1..10).to_a.sample,
  user_id:  user.id, title: "Master bong hut", description: Faker::Lorem.paragraph)
Unavailability.create(start_date:"2016-04-21", end_date:"2016-04-30", flat_id: flat.id)


user = User.create( first_name:'xam', last_name:'owning', email: 'xam.owning@gmail.com', password: "xxxxxxxx", created_at: Time.now,
  updated_at: Time.now)

flat = Flat.create( city:'Chicago', address:'1, main street', capacity: (2..5).to_a.sample, price: (1..10).to_a.sample,
 user_id:  user.id,  title: "Awesome hut", description: Faker::Lorem.paragraph)
Unavailability.create(start_date:"2016-04-01", end_date:"2016-04-10", flat_id: flat.id)

flat = Flat.create( city:'Chicago', address:'2, main street', capacity: (2..5).to_a.sample, price: (1..10).to_a.sample,
  user_id:  user.id, title: "Hippie hut", description: Faker::Lorem.paragraph)
Unavailability.create(start_date:"2016-04-11", end_date:"2016-04-20", flat_id: flat.id)

flat = Flat.create( city:'Chicago', address:'3, main street', capacity: (2..5).to_a.sample, price: (1..10).to_a.sample,
  user_id:  user.id, title: "Master bong hut", description: Faker::Lorem.paragraph)
Unavailability.create(start_date:"2016-04-21", end_date:"2016-04-30", flat_id: flat.id)

flat = Flat.create( city:'Chicago', address:'4, main street', capacity: (2..5).to_a.sample, price: (1..10).to_a.sample,
 user_id:  user.id, title: "Awesome hut", description: Faker::Lorem.paragraph)
Unavailability.create(start_date:"2016-05-01", end_date:"2016-05-10", flat_id: flat.id)

flat = Flat.create( city:'Chicago', address:'5, main street', capacity: (2..5).to_a.sample, price: (1..10).to_a.sample,
  user_id:  user.id, title: "Hippie hut", description: Faker::Lorem.paragraph)
Unavailability.create(start_date:"2016-05-11", end_date:"2016-05-20", flat_id: flat.id)

flat = Flat.create( city:'Chicago', address:'6, main street', capacity: (2..5).to_a.sample, price: (1..10).to_a.sample,
  user_id:  user.id, title: "Master bong hut", description: Faker::Lorem.paragraph)
Unavailability.create(start_date:"2016-05-21", end_date:"2016-05-30", flat_id: flat.id)





