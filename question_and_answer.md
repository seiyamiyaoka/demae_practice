## Answer

- user = User.find(1), user.orders
- Order.last.user.name
- City.select(:id, :name) もしくは City.pluck(:id, :name)
- shibuya = Shop.find(shibuyaのid), shibuya.shops
- user.orders.joins(:foods).pluck(:name)
- user.orders.joins(:foods).sum("foods.price")
