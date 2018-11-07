require 'open-uri'
require 'nokogiri'
require 'rubygems'

class ScraperCoin

  def name_market_coin
    p "********************NAME****************************"
    page_market = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
    name = page_market.xpath('//a[@class = "currency-name-container link-secondary"]').map do |node| node.text
      end
  end

  def get_price
    p "********************PRICE****************************"
    page_crypto = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
    price = page_crypto.xpath('//a[@class="price"]').map do |node| node.text
    end
  end


  def hash
    # get_price("https://coinmarketcap.com/all/views/all/")
    # name_market_coin("https://coinmarketcap.com/all/views/all/")
    @mix = Hash[name_market_coin.zip(get_price)]
  end

  def save
    hash.save
  end

  def perform
    p hash
  end

end 