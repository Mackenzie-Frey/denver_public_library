class Author

  attr_reader :books,
              :first_name,
              :last_name

  def initialize(author_info)
    @first_name = author_info[:first_name]
    @last_name = author_info[:last_name]
    @books = []
  end

  def add_book(title, publication_date)
    book = Book.new({author_first_name: @first_name, author_last_name: @last_name, title: title, publication_date: publication_date})
    @books << book
    book
  end

end
