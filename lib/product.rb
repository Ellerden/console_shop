class Product
 attr_accessor :price, :left
  
  def initialize(params)
    @price = params[:price]
    @left = params[:amount]
  end
  
  def to_s
    "#{@price} р. (осталось #{@left})"
  end
  
  def self.from_file(file_path)
   raise NotImplementedError
  end
end