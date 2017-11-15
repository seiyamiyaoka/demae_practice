## Question

- user_id 1のuserが注文した件数
- 最後に注文したuserの名前
- cityの名称一覧(id, nameのみ出力)
- 渋谷区のshop一覧取得
- 1のuserが注文した料理一覧を取得
- 1のuserが注文した料理の合計金額を取得


## Answer

- user = User.find(1), user.orders
- Order.last.user.name
- City.select(:id, :name) もしくは City.pluck(:id, :name)
- shibuya = Shop.find(shibuyaのid), shibuya.shops
- user.orders.joins(:foods).pluck(:name)
- user.orders.joins(:foods).sum("foods.price")
