require 'shelfari/book'
require 'shelfari/user'
require 'shelfari/helper'

module Shelfari
  class API
    include Shelfari::Book
    include Shelfari::User    
    include Shelfari::Helper    
        
    def initialize
      @agent = Mechanize.new
    end
    
    def request(uri)
      @agent.get('http://www.shelfari.com'+uri)
    end
    
    def response(response)
      JSON.generate(response)
    end
  end
end
