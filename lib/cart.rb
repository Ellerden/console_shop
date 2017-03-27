class Cart
attr_accessor :purchase, :final_sum, :user_choice

  def initialize
    @purchase = []
    @final_sum = 0
    @user_choice = []
  end

  # тут будем добавлять в карту покупки (и вызывать метод для уменьшения количества остатков)
  # корзина знает индекс выбранного товара в общей коллекции товаров, его цену, количество и сколько его заказал юзер
  def add_to_cart(params)
    @amount = params[:amount]
     @purchase = {
       index: params[:index], # проблема с выводом в нормальном формате, поэтому будем выводить из collection по индексу
       price: params[:price],
       left: params[:left],
       amount: params[:amount],
    }

    if any_left?
      total
      check_duplicate
      @user_choice << @purchase if @duple == false
    end
  end


  # это не метод с boolean, Чтобы 2 раза одно и тоже не вызывать, в этом методе суммируем общее
  # количество купленного, если нам попались дупликанты
  def check_duplicate
    @duple = false
    if !user_choice.empty?

      if @user_choice.to_a.any? do |i|

        if i[:index] == purchase[:index]
          i[:amount] += @purchase[:amount]
          @duple = true
        end
      end

      end
    end
  end

  # тут будем проверять нужное ли количество товаров осталось на складе
  def any_left?
    @purchase[:left] - @amount >= 0
  end

  def total
    @final_sum += @purchase[:price] * @amount
  end
  end

