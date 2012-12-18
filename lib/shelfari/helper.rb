module Shelfari
  module Helper
    def extract_books(page)
      results = Hash.new
      raw_books = page.parser.xpath("//a[@class='book']").each{ |raw_book|
        if !results.has_key?(raw_book['bookid'])
          book = {
            :bookid => raw_book['bookid'],
            :editionid => raw_book['editionid'],
            :title => raw_book.xpath(".//img").first['alt'],
            :cover => raw_book.xpath(".//img").first['src'],
            :url => raw_book['href']
          }        
      
          results[raw_book['bookid']] = book
        end
        }
      results.values
    end
  end
end
