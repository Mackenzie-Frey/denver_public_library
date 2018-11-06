class Library

  attr_reader :books

  def initialize
    @books = []
  end

  def add_to_collection(book)
    @books << book
  end

  def include?(title)
    @books.each do |book|
      if book.title == title
        return true
      end
    end
    false
  end

  def card_catalogue
    @books.sort_by do |book|
      book.author_last_name
    end
  end

  def find_by_author(author_name)
    book_array = @books.find_all do |book|
      book.author_first_name + " " + book.author_last_name == author_name
    end
    new_hash = {}
    book_array.each do |book|
      new_hash[book.title] = book
    end
    new_hash
  end

  def find_by_publication_date(date)
    book_array = @books.find_all do |book|
      book.publication_date == date
    end
    new_hash = {}
    book_array.each do |book|
      new_hash[book.title] = book
    end
    new_hash
  end
end
