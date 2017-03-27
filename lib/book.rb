class Book < Product
  attr_accessor :title, :genre, :author

  def initialize(params)
    super
    @title = params[:title]
    @genre = params[:genre]
    @author = params[:author]
    to_s
  end

  def to_s
    "Книга - «#{@title}», #{@genre}, автор — #{@author}, #{super}"
  end

  def self.from_file(file_name)
    lines = File.readlines(file_name).map { |i| i.chomp }
    self.new(title: lines[0], genre: lines[1], author: lines[2], price: lines[3], amount: lines[4])
  end
end