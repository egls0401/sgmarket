# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(id:1, email:'admin@sgmarket.com', password:'rktdbsgud123$', username:'관리자',realname:'어드민', admin:true, userpic:'hugging', confirmable: true)