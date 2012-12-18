module Shelfari
  module Book
    def book_by_id(id)
      page = request('/books/'+id.to_s)
      raw_book = page.parser.xpath("//a[@bookid='"+id.to_s+"']").first
      book = [
        :bookid => id.to_s,
        :editionid => raw_book['editionid'],
        :title => raw_book['title'],
        :author => page.title.gsub(/(.*)by\s/, ''),
        :cover => raw_book.xpath(".//img").first['src'],
        :url => raw_book['href']
      ]
      response(book)
    end
    
    def book_by_isbn(isbn)
      page = request('/search/books?Keywords='+isbn.to_s)
      response(extract_books(page).first)
    end
    
    def search(title)
      page = request('/search/books?Keywords='+title.gsub(/\s/, '%20'))
      response(extract_books(page))
    end
  end
end
