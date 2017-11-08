class CreateShopGenres < ActiveRecord::Migration[5.1]
  def change
    create_table :shop_genres do |t|
      t.references :shop, foreign_key: true
      t.references :genre, foreign_key: true

      t.timestamps
    end
  end
end
