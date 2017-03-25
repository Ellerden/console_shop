class Film < Product
  attr_accessor :title, :year, :director

  def initialize(params)
    super
    @title = params[:title]
    @year = params[:year]
    @director = params[:director]
  end

  def to_s
    "Фильм - «#{@title}», #{@year}, режиссер - #{@director}, #{super}"
  end
end