class AddPriceColumnToFood < ActiveRecord::Migration[5.1]
  def change
    add_column :foods, :price, :integer
  end
end
