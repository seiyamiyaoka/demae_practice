## Answer

- user = User.find(1), user.orders
- Order.last.user.name
- City.select(:id, :name) もしくは City.pluck(:id, :name)
- shibuya = City.find(shibuyaのid), shibuya.shops
- user.orders.joins(:foods).pluck(:name)
- user.orders.joins(:foods).sum("foods.price")
- User.joins(orders: :foods).group("users.id, users.name").sum("foods.price")
- User.joins(orders: :foods).group("users.id, users.name").order('sum_price desc').sum(:price)
<!-- sum_合計した時に使ったカラム名 でorderができるできる(asとして定義されている?) -->
- user = User.find(1); user.orders.select(:id, :user_id).first.user_id
- User.where("name like ?", "%a%")
- User.where(id: 1..5)
- User.limit(5).joins(:orders).group(:name, :id).order(count: :desc).count(:id)
- Shop.where(name: nil)
