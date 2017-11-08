# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
city = City.create(name: "新宿")
shop = Shop.create(name: "新宿居酒屋", city_id: city.id)
genre = Genre.create(name: "中華")
# genreのインスタンスとしてshopsがあるので最終的にはgenreを保存する必要がある
# http://www.rokurofire.info/2014/02/26/rails_tablerelationship/ <==いいリンク
# city_idがないとエラーになる
genre.shops.build(name: "新宿の居酒屋", city_id: city.id)
genre.save

# TODO: カテゴリ作成

category = Category.create(name: "魚")
category.foods.build(shop_id: shop.id, name: "ホッケの塩焼き").save

user = User.create(name: "tarou")
food = Food.first
food.orders.build(user_id: user.id)
food.save
order = Order.first
order.build_order_information(payment: "creditcard")
order.save
