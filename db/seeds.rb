require 'csv'

cities = []
if File.exist?("./lib/master_data/13tokyo.csv")
  CSV.foreach('./lib/master_data/13tokyo.csv', encoding: 'Shift_JIS:UTF-8').each do |row|
    unless cities.include?(row[9])
      cities << row[9]
      city = City.create(name: row[9])
    end
  end
end
city = City.last
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
