class CreateBrokers < ActiveRecord::Migration
  def change
    create_table :brokers do |t|
      t.string :name
      t.string :image
      t.integer :min_deposit
      t.decimal :margin_rate
      t.decimal :stock_trade_fee
      t.decimal :mutual_fund_trade_fee
      t.decimal :option_base_trade_fee

      t.timestamps null: false
    end
  end
end
