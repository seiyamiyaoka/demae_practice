require 'csv'
genres = %w(中華 イタリアン 和食)
categories = %w(魚 肉 野菜)
payments = %w(クレジット 現金 請求書)
cities = []

class MasterDate
  def self.user_setup
    User.create(name: Faker::Name.unique.name)
  end

  def self.genre_setup(genres)
    genres.each { |genre| Genre.create(name: genre) }
  end

  def random_data(obj)
    eval("#{obj}.offset((rand(#{obj}.count))).first")
  end
end

data_obj = MasterDate.new

if File.exist?("./lib/master_data/13tokyo.csv")
  CSV.foreach('./lib/master_data/13tokyo.csv', encoding: 'Shift_JIS:UTF-8').each do |row|
    unless cities.include?(row[9])
      MasterDate.user_setup if User.count < 10
      cities << row[9]
      city = City.create(name: row[9])
    end
  end
end

100.times do
  rand_num = rand(3)
  city =  City.offset((rand(City.count))).first
  city =  data_obj.random_data("City")
  # shop = Shop.create(name: "#{Faker::Food.ingredient} shop", city_id: city.id)
  genre = Genre.create(name: genres[rand_num])
  # genreのインスタンスとしてshopsがあるので最終的にはgenreを保存する必要がある
  # http://www.rokurofire.info/2014/02/26/rails_tablerelationship/ <==いいリンク
  # city_idがないとエラーになる
  genre.shops.build(name: "#{Faker::Food.ingredient} shop", city_id: city.id)
  genre.save

  # TODO: カテゴリ作成
  shop =  data_obj.random_data("Shop")
  category = Category.create(name: categories[rand_num])
  category.foods.build(shop_id: shop.id, name: Faker::Food.dish).save

  user = data_obj.random_data("User")
  food = category.foods.first
  food.orders.build(user_id: user.id)
  food.save
  order = food.orders.first
  # binding.pry
  order.build_order_information(payment: payments[rand_num])

  order.save

end
