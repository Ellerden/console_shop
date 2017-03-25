# Создайте в основной программе какой-нибудь продукт, например, «фильм Леон».
# Выведите его стоимость в консоль.
require_relative "lib/productcollection"
require_relative "lib/product.rb"
require_relative "lib/book.rb"
require_relative "lib/film.rb"

# require 'active_support/inflector'
current_path = File.dirname(__FILE__)

collection = ProductCollection.new("films")

collection.to_a.each do |product|
  puts product
end


