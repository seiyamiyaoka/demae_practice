class CreateOrderInformations < ActiveRecord::Migration[5.1]
  def change
    create_table :order_informations do |t|
      t.references :order, foreign_key: true
      t.string :payment

      t.timestamps
    end
  end
end
