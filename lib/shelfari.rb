require 'rubygems'
require 'bundler/setup'
require 'mechanize'
require 'json'
require 'pp'

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
   
    user = [
      :description => page.parser.at('meta[@name="description"]')[:content],
      :avatar => page.parser.xpath("//a[@class='avatar']//img").first['src']
    ]

    JSON.generate(user)
  end

  def search(title)
    url = @@base_url+'/search/books?Keywords='+title.gsub(/\s/, '%20')
    page = @agent.get(url)
    
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

    return JSON.generate(results)
  end
end