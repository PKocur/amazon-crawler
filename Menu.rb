require './crawler/AmazonCrawler'

def welcome
  puts "============================================="
  puts "Welcome in the simple Amazon console crawler!"
  puts "============================================="
end

def choose_product
  puts "What product are you looking for?"
  gets.chomp
end

def show_products(products)
  puts "-------------------------------------------"
  puts "Results:"
  i = 1
  products.each { |product|
    puts i.to_s + ". " + product.to_s
    i += 1
  }
end

def goodbye
  puts "========================="
  puts "Thanks for using the app!"
  puts "========================="
end

welcome
product = choose_product
crawler = AmazonCrawler.new
show_products crawler.get_products_list product, 100
goodbye
