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

  def from_file(file_name)
    lines = File.readlines(file_name)
    @title = lines[0]
    @year = lines[1]
    @director = lines[2]
    @price = lines[3]
    @left = lines[4]
  end
end