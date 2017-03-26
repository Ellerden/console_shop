class Cd < Product
  attr_accessor :title, :artist, :genre, :year

  def initialize(params)
    super
    @title = params[:title]
    @artist = params[:artist]
    @genre = params[:genre]
    @year = params[:year]
  end

  def to_s
    "Альбом #{artist} - «#{@title}», жанр - #{@genre}, #{@year}, #{super}"
  end

  def self.from_file(file_name)
    lines = File.readlines(file_name).map { |i| i.chomp }
    @title = lines[0]
    @artist = lines[1]
    @genre = lines[2]
    @year = lines[3]
    @price = lines[4]
    @left = lines[5]
    # это для collection можно и через self.new но я пока не разобралась как это работает
    lines.to_s
  end
end