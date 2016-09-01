# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(id:1, email:'yooncastle@sogang.ac.kr', password:'dbstjdzla', username:'산타', realname:'김윤성',admin:true, userpic:"hugging", confirmed_at: Time.now)
User.create(id:2, email:'sgu960401@sogang.ac.kr', password:'516578', username:'괜차나', realname:'이찬하' ,admin:true, userpic:"happy", confirmed_at: Time.now)
User.create(id:3, email:'ladybk@sogang.ac.kr', password:'qhrudrkd', username:'장사꾼', realname:'강보경',admin:true, userpic:"money", confirmed_at: Time.now)