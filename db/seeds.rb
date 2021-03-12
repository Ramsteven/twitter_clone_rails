# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#
#
User.create(fullname:"mashur jimenez", username:"manshur",email:"manshur@example.com", password:"password")
User.create(fullname:"paolo jimenez", username:"paolo",email:"paolo@example.com", password:"password")
User.create(fullname:"luna jimenez", username:"luna",email:"luna@example.com", password:"password")
User.create(fullname:"luna jimenez", username:"landazuri",email:"landazuri@example.com", password:"password")
User.create(fullname:"diego jimenez", username:"diego",email:"diego@example.com", password:"password")
User.create(fullname:"messi jimenez", username:"messi",email:"messi@example.com", password:"password")
User.create(fullname:"ronaldo jimenez", username:"ronaldo",email:"ronaldo@example.com", password:"password")
User.create(fullname:"kaka jimenez", username:"kaka",email:"kaka@example.com", password:"password")
User.create(fullname:"maria jimenez", username:"maria",email:"maria@example.com", password:"password")
User.create(fullname:"luisa jimenez", username:"luisa",email:"luisa@example.com", password:"password")
User.create(fullname:"pepito jimenez", username:"pepito",email:"pepito@example.com", password:"password")
User.create(fullname:"juanito jimenez", username:"juanito",email:"juanito@example.com", password:"password")
User.create(fullname:"dianita jimenez", username:"dianita",email:"dianita@example.com", password:"password")
User.create(fullname:"lorencita jimenez", username:"lorencita",email:"lorencita@example.com", password:"password")
User.create(fullname:"temble jimenez", username:"temble",email:"temble@example.com", password:"password")
User.create(fullname:"pibe jimenez", username:"pibe",email:"pibe@example.com", password:"password")
User.create(fullname:"tino jimenez", username:"tino",email:"tino@example.com", password:"password")
User.create(fullname:"aristi jimenez", username:"aristi",email:"aristi@example.com", password:"password")
User.create(fullname:"marla jimenez", username:"marla",email:"marla@example.com", password:"password")
User.create(fullname:"condesa jimenez", username:"condesa",email:"condesa@example.com", password:"password")


User.all.each do |user|
  user.tweets.create(body:"i am tweet from the user #{user.username} with id #{user.id}")
  user.tweets.create(body:"i am second tweet from the user #{user.username} with id #{user.id}")
  user.tweets.create(body:"i am the last tweet tweet from the user #{user.username} with id #{user.id}")
end

