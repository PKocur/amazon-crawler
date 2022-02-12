require './crawler/Product'

class HtmlToProductConverter
  @@get_price_regex = "\\$\\d+(?:\\.\\d+)?"
  @@ad_text = "Sponsored"
  @@ad_separator_text = "Leave ad feedback"
  @@unknown_price_text = "Price unknown"

  def convert(result_string)
    if result_string.include? @@ad_text
      name = result_string.split(@@ad_separator_text)[1].split("  ")[1]
    else
      name = result_string.split("  ")[2]
    end
    if result_string.match?(@@get_price_regex)
      price = result_string.match(@@get_price_regex)[0]
    else
      price = @@unknown_price_text
    end
    Product.new(name, price)
  end
end
