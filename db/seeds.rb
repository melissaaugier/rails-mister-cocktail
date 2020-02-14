require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)

puts 'Cleaning database ...'
Ingredient.destroy_all

puts 'Creating ingredients ...'
ingredients["drinks"].each do |ingredient|
  Ingredient.create!(name: ingredient['strIngredient1'])
end
puts 'Ingredients created !'
