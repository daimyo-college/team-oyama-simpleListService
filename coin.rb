require 'ruby_bitbankcc'
require 'pry'

bbcc = Bitbankcc.new

btc_result = JSON.parse(bbcc.read_ticker('btc_jpy').body)
xrp_result = JSON.parse(bbcc.read_ticker('xrp_jpy').body)

btc_last = btc_result["data"]["last"].to_i
xrp_last = xrp_result["data"]["last"].to_f

puts "BTC: #{btc_last} JPY/XRP"
puts "XRP: #{xrp_last} JPY/BTC"

owned_assets_btc = 1
owned_assets_xrp = 1000

sum = owned_assets_btc * btc_last + owned_assets_xrp * xrp_last

puts "ASSET: #{sum.round}JPY"
