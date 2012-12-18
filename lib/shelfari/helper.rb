module Shelfari
  module Helper
    def extract_books(page)
      results = Hash.new
      raw_books = page.parser.xpath("//a[@class='book']").each{ |raw_book|
        if !results.has_key?(raw_book['bookid'])
          book = [
            :bookid => raw_book['bookid'],
            :title => raw_book.xpath(".//img").first['alt'],
            :url => raw_book['href']
          ]        
      
          results[raw_book['bookid']] = book
        end
        }
      results
    end
  end
end
