require_relative "lib/productcollection"
require_relative "lib/product.rb"
require_relative "lib/book.rb"
require_relative "lib/film.rb"
require_relative "lib/cart.rb"

current_path = File.dirname(__FILE__)

puts "Добро пожаловать в магазин книг, музыки и фильмов."
puts "Что вы хотите купить?"
user_cart = Cart.new # создаем пользовательскую корзину для покупок
status = :in_progress  # :exit

# получаем коллекцию продуктов по каждой категории

collection = ProductCollection.from_dir(current_path + '/data')
collection_array = collection.to_a
# показываем все продукты из каждой категории
until status == :exit

  collection_array.each_with_index { |value, index| puts "#{index+1}. #{value}" }
  puts "0 - завершить покупки"
  puts "_________"

  user_input = STDIN.gets.chomp  # не переводим его в to_i чтобы он не преобразовал любой не нумерик символ в 0
  case user_input
    when "0"
      # ТУТ делаем чек аут

      puts "Вы купили: "
      user_cart.user_choice.each do |i|
        collection_array.each_with_index do |value, ind|
          puts "#{value}. Куплено шт.: #{i[:amount]}" if ind == i[:index]
        end
      end
      puts "С вас - #{user_cart.final_sum} руб. Спасибо за покупку!"
      status = :exit
    when "1"..collection_array.to_a.size.to_s

      puts "Сколько экземпляров вы хотите купить?"
      user_amount = STDIN.gets.to_i

      #вызываем корзину
      user_cart.add_to_cart(index: user_input.to_i - 1, price: collection_array[user_input.to_i - 1].price.to_i,
                            left: collection_array[user_input.to_i - 1].left.to_i, amount: user_amount)

      if user_cart.any_left?
        collection_array[user_input.to_i - 1].left = (collection_array[user_input.to_i - 1].left.to_i - user_amount).to_s
        puts "Вы выбрали: #{collection_array[user_input.to_i - 1]}. Куплено: #{user_amount}"
        puts "Всего товаров на сумму: #{user_cart.final_sum} руб."
        puts "_________"
      else
        puts "К сожалению, нет столько товаров :("
      end
  end
end
