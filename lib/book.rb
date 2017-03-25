class Book < Product
  attr_accessor :title, :genre, :author

  def initialize(params)
    super
    @title = params[:title]
    @genre = params[:genre]
    @author = params[:author]
  end

  def to_s
    "Книга - «#{@title}», #{@genre}, автор — #{@author}, #{super}"
  end

  def from_file(file_name)
    lines = File.readlines(file_name)
    @title = lines[0]
    @genre = lines[1]
    @author = lines[2]
    @price = lines[3]
    @left = lines[4]
  end
end