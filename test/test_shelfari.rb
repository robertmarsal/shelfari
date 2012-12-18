require 'test/unit'
require 'shelfari'

class ShelfariTest < Test::Unit::TestCase
  @@library = Shelfari.new
  @@test_user = 'robertboloc'

  def test_book
    testBook = @@library.book_by_id(5831441)

    # check id
    assert testBook.include? '5831441' 

    # check title
    assert testBook.include? 'The Girl Who Kicked the Hornet\'s Nest'
    
    # check author
    assert testBook.include? 'Stieg Larsson'
  end

  def test_user
    testUser = @@library.user(@@test_user)

    #check avatar
    assert testUser.include? 'http://'
  end
    
  def test_now_reading
    testNowReading = @@library.now_reading(@@test_user)

    #check
    assert testNowReading.include? 'books'
  end
end
