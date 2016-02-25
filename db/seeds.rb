# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.destroy_all
Broker.destroy_all

Admin.create(email: 'test@test.com', password: '123')

Broker.create(name: "Etrade", image: "http://logonoid.com/images/e-trade-logo.png", min_deposit: 500, margin_rate: 0.0844, stock_trade_fee: 9.99, mutual_fund_trade_fee: 19.99, option_base_trade_fee: 9.99, website: "www.etrade.com")
Broker.create(name: "Fidelity", image: "http://3.bp.blogspot.com/-8w3v3ZfRzdY/UUo2F9yI50I/AAAAAAAAC-o/Xp-CtSAPFs0/s1600/Fidelity_Thumbnail.png", min_deposit: 2500, margin_rate: 0.0808, stock_trade_fee: 7.95, mutual_fund_trade_fee: 49.95, option_base_trade_fee: 7.95, website: "www.fidelity.com")
Broker.create(name: "Scottrade", image: "http://moneytipcentral.com/wp-content/uploads/2009/03/scottrade-logo-220x220.png", min_deposit: 2500, margin_rate: 0.0775, stock_trade_fee: 7, mutual_fund_trade_fee: 17, option_base_trade_fee: 7, website: "www.scottrade.com")
