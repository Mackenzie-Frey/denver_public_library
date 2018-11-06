require './test/test_helper'
require './lib/author'
require './lib/book'

class AuthorTest < Minitest::Test

  def test_it_exists
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    assert_instance_of Author, charlotte_bronte
  end

  def test_it_has_attributes
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    assert_equal "Charlotte", charlotte_bronte.first_name
    assert_equal "Bronte", charlotte_bronte.last_name
  end

  def test_has_books
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    assert_equal [], charlotte_bronte.books

    book = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    assert_equal [book], charlotte_bronte.books
  end

  def test_it_adds_books
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    book = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    actual = charlotte_bronte.books.first
    assert_instance_of Book, actual

    assert_equal "Charlotte", book.author_first_name
  end


end
