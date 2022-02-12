require './crawler/HtmlToProductConverter'

class HtmlToProductsConverter

  def initialize
    @html_to_product_converter = HtmlToProductConverter.new
  end

  def convert(html_body, max_count)
    products = []
    i = 0
    while i <= max_count
      i += 1
      nth_result_html_text = "div[cel_widget_id=\"MAIN-SEARCH_RESULTS-#{i}\"]"
      result = html_body.at(nth_result_html_text)
      if result == nil
        next
      end
      result_string = result.text.to_s
      products.push @html_to_product_converter.convert result_string
    end
    products
  end
end
