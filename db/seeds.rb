# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Menu_item.create(product: 'Small Latte', description: 'Single shot columbian coffee, 8oz', price:3.00)
MenuItem.create! [
  { id: 1, product: "Small Latte", description: "Single shot columbian coffee, 8oz", price: 3.00 },
]