require './test/test_helper'
require './lib/book'

class BookTest < Minitest::Test

  def test_it_exists
    book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})
    assert_instance_of Book, book
  end

  def test_it_has_attributes
    book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})
    assert_equal "Harper", book.author_first_name
skip
    assert_equal "Lee", book.author_last_name

    assert_equal "To Kill a Mockingbird", book.title

    assert_equal "1960", book.publication_date
  end
end

# What's the stroy with quotes in Ruby?
