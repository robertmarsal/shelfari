require 'bundler/setup'
require 'mechanize'
require 'json'

class Shelfari
  @@base_url = 'http://www.shelfari.com'
  def initialize
    @agent = Mechanize.new
  end

  def book(id)
    url = @@base_url+'/books/'+id.to_s
    page =  @agent.get(url)
    
    raw_book = page.parser.xpath("//a[@bookid='"+id.to_s+"']").first
    book = [
      :bookid => id.to_s,
      :editionid => raw_book['editionid'],
      :title => raw_book['title'],
      :author => page.title.gsub(/(.*)by\s/, ''),
      :cover => raw_book.xpath(".//img").first['src'],
      :url => raw_book['href']
    ]

    JSON.generate(book)
  end

  def user(username)
    url = @@base_url+'/'+username
    page = @agent.get(url)

    desc = page.parser.at('meta[@name="description"]')
   
    user = [
      :description => desc ? desc[:content] : nil,
      :avatar => page.parser.xpath("//a[@class='avatar']//img").first['src'],
      :books => extract_books(page)
    ]

    JSON.generate(user)
  end

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
 
  def search(title)
    url = @@base_url+'/search/books?Keywords='+title.gsub(/\s/, '%20')
    page = @agent.get(url)
    results = extract_books(page)
    return JSON.generate(results)
  end

  def now_reading(user)
    url = @@base_url+"/#{user}/lists/NowReading"
    page = @agent.get(url)
    page.parser.xpath("//script").each do |raw_script|
      raw_script.children.each do |kid| 
        if kid.content =~ /shelfPrePopulation/
          # trim the front
          val = kid.content.sub(/^[^{]*/,'')
          # trim the back 
          val.sub!(/;\s*$/, '')
          return val
        end
      end
    end
  end
end
