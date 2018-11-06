require './test/test_helper'
require './lib/library'
require './lib/book'
require './lib/author'

class LibraryTest < Minitest::Test

  def test_it_exists
    library = Library.new
    assert_instance_of Library, library
  end

  def test_it_has_no_books
    dpl = Library.new
    assert_equal [], dpl.books
  end

  def test_it_adds_book
    dpl = Library.new
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    dpl.add_to_collection(jane_eyre)
    assert_equal [jane_eyre], dpl.books
  end


  def test_it_know_if_has_book
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")

    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")

    dpl = Library.new
    dpl.add_to_collection(jane_eyre)
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(villette)
    assert dpl.include?("To Kill a Mockingbird")

    refute dpl.include?("A Connecticut Yankee in King Arthur's Court")
  end

  def test_it_sort_by_last_name
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")

    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")

    dpl = Library.new
    dpl.add_to_collection(jane_eyre)
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(villette)
    assert_equal [jane_eyre, villette, mockingbird] , dpl.card_catalogue
  end

  def test_it_can_find_by_author
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")

    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")

    dpl = Library.new
    dpl.add_to_collection(jane_eyre)
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(villette)

    actual = dpl.find_by_author("Charlotte Bronte")
    expected = {"Jane Eyre" => jane_eyre, "Villette" => villette}
    assert_equal expected ,actual
  end

  def test_it_finds_by_publication_date
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")

    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")

    dpl = Library.new
    dpl.add_to_collection(jane_eyre)
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(villette)

    actual = dpl.find_by_publication_date("1960")
    expected = {"To Kill a Mockingbird" => mockingbird}
    assert_equal expected, actual
  end

end
