# README

## how to

### 環境構築後にrake db:seedでデータを入れます

## 出前を注文するアプリです

### usersテーブル お客さんの情報が入ります
### ordersテーブル 注文内容が入ります(住所など入れる予定, user_id)
### order_informationsテーブル 注文の詳細情報(カードの情報, order_id, 現金支払いなど)
### shopsテーブル お店情報(お店の名前, cityのid)
### citiesテーブル 区の名前(杉並区, 渋谷区など)
### genresテーブル (中華, イタリアンなど)
### genre_shopsテーブル(中間テーブル)
### categoriesテーブル(デザート, 定食など)
### foodsテーブル(category_id, shop_id, 商品名)
### food_ordersテーブル(中間テーブル)


## Question

- user_id 1のuserが注文した件数
- 最後に注文したuserの名前
- cityの名称一覧(id, nameのみ出力)
- 渋谷区のshop一覧取得
- 1のuserが注文した料理一覧を取得
- 1のuserが注文した料理の合計金額を取得
- 全てのuserの注文金額をそれぞれ取得
- 全てのuserの注文金額が高い順に並び替えて名前と金額を取得
- category別の商品一覧を取得
- user.orders.select(:id).first.user_id このコマンドを入力するとエラーになる, エラーにならずにuser_idが出力されるように変更してください。
- userの名前に"a"が含まれる人を出力
- userのidが5以下の人たち
- 注文をしたuserの中で注文数が多い順に5人限定で並べる
- shopの名前がnilのものを取得してください
