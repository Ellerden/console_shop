# Создайте в основной программе какой-нибудь продукт, например, «фильм Леон».
# Выведите его стоимость в консоль.

require_relative "lib/product.rb"
require_relative "lib/book.rb"
require_relative "lib/film.rb"
current_path = File.dirname(__FILE__)

film1 = Film.from_file(current_path + '/data/films/01.txt')
book1 = Film.from_file(current_path + '/data/books/01.txt')

puts film1
puts book1

ProductCollection.from_dir(film)

# Вызываем метод from_file у класса Product
begin
  Product.from_file(current_path + '/data/films/01.txt')
rescue NotImplementedError
  puts 'Метод класса Product.from_file не реализован'
end


# depot = []
# book1 = Book.new(title: "Евгений Онегин", genre: "Повесть", author: "Пушкин", price: 290, amount: 4)
# depot << book1
# movie1 = Film.new(title: "Трудности перевода", year: 2002, director: "София Коппола", price: 320, amount: 1)
# depot << movie1
# book2 = Book.new(title: "Шинель", genre: "Рассказ", author: "Гоголь", price: 100, amount: 92)
# depot << book2
# movie2 = Film.new(title: "3+2", year: 1973, director: "Юлия Рос", price: 1290, amount: 224)
# depot << movie2
# depot.each{|i| puts i }


