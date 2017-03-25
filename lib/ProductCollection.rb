require_relative "product.rb"
require_relative "book.rb"
require_relative "film.rb"

class ProductCollection
  attr_accessor :products

  def initialize(path)
   @path = path
   @products = []
   from_dir
  end

#считывает продукты из папки data, сам понимая, какие товары в какой папке лежат.
  def from_dir
    @products = []
    case @path
      when "films"
        Dir["data/"+ @path + "/*.txt"].each { |file_name| @products << Film.from_file(file_name) }
      when "books"
        Dir["data/"+ @path + "/*.txt"].each { |file_name| @products << Book.from_file(file_name) }

    end



    # Dir["data/"+ @path + "/*.txt"].each { |file_name| @products << from_class.from_file(file_name)}

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
  end
end

