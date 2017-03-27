require_relative "product.rb"
require_relative "book.rb"
require_relative "film.rb"
require_relative "cd.rb"

class ProductCollection
  attr_accessor :products

  def initialize(products)
    @products = products
  end

#считывает продукты из папки data, сам понимая, какие товары в какой папке лежат.
  def self.from_dir(path)
    items = []

    Dir.glob(path + '*/**').each do |fn|

      #   получаем имя папки-уникальной категории продуктов (Films, Books, Cds)
      class_path = fn.to_s.split("/").last

      case class_path
        when "books" then class_name = Object.const_get("Book")
        when "films" then class_name = Object.const_get("Film")
        when "cds" then class_name = Object.const_get("Cd")
      end

      # Получаем продукты по каждой категории и добавляем их в общий массив
      Dir[fn + "/*.txt"].each { |file_name| items << class_name.from_file(file_name) }
      end

    self.new(items)
  end

  # возвращает массив товаров.
  def to_a
    @products
  end

# сортирует товары по цене, остатку на складе или по названию (как по возрастанию, так и по убыванию)
  def sort(params)
    # Делает выбор по параметру by
    case params[:by]
      when :title
        @products.sort_by! { |product| product.to_s }
      when :price
        @products.sort_by! { |product| product.price }
      when :amount
        @products.sort_by! { |product| product.left }
      end

    @products.reverse! if params[:order] == :asc
    self
  end
end

