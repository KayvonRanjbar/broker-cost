class AddWebsiteToBrokers < ActiveRecord::Migration
  def change
    add_column :brokers, :website, :string
  end
end
