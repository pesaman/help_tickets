# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the
# db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

	
  p User.create!(email: 'admin@hotmail.com', password: 'password', admin: true)
  p User.create!(email: 'user@hotmail.com', password: 'password')



