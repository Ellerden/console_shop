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

  def self.from_file(file_name)
    # (file_path, encoding: 'UTF-8').map { |l| l.chomp }
    lines = File.readlines(file_name).map { |i| i.chomp }
    @title = lines[0]
    @year = lines[1]
    @director = lines[2]
    @price = lines[3]
    @left = lines[4]
    # это для collection
    lines.to_s
  end
end