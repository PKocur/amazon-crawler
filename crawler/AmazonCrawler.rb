require 'nokogiri'
require 'open-uri'
require './crawler/HtmlToProductsConverter'

class AmazonCrawler
  @@amazon_find_url = "https://www.amazon.com/s?k="
  @@user_agent = "firefox"

  def initialize
    @html_to_products_converter = HtmlToProductsConverter.new
  end

  def get_products_list(product_name, max_count)
    html_response = call product_name
    @html_to_products_converter.convert html_response, max_count
  end

  def call(product_name)
    Nokogiri::HTML5(URI.open(@@amazon_find_url + product_name, "User-Agent" => @@user_agent))
  end
end
