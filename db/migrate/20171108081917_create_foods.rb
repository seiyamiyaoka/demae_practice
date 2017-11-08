class CreateFoods < ActiveRecord::Migration[5.1]
  def change
    create_table :foods do |t|
      t.references :shop, foreign_key: true
      t.references :category, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
