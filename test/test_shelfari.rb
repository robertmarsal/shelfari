require 'test/unit'
require 'shelfari'

class ShelfariTest < Test::Unit::TestCase
  @@library = Shelfari.new
  def test_book
    testBook = @@library.book(5831441)

    # check id
    assert testBook.include? '5831441' 

    # check title
    assert testBook.include? 'The Girl Who Kicked the Hornet\'s Nest'
    
    # check author
    assert testBook.include? 'Stieg Larsson'
  end

  def test_user
    testUser = @@library.user('robertboloc')

    #check avatar
    assert testUser.include? 'http://'
  end
end
