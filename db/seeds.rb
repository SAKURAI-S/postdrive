# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
   email: 'test0@test.com',
   password: '000000',
   username: '管理者',
)

User.create!(
   email: 'test1@test.com',
   password: '111111',
   username: 'ユーザー１',
)
User.create!(
   email: 'test2@test.com',
   password: '222222',
   username: 'ユーザー2',
)
