require 'rubygems'
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
	raw_book = @agent.get(url).parser.xpath("//a[@bookid='"+id.to_s+"']").first
	book = [:bookid => id.to_s, 
	        :editionid => raw_book['editionid'], 
			:title => raw_book['title'], 
			:link => raw_book['href']]
	JSON.generate(book)
  end
end