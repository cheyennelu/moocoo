class AddPriceToProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :price, :integer
    add_monetize :products, :price, currency: { present: false }
  end
end
