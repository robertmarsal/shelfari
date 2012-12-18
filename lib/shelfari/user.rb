module Shelfari
  module User
    def user(user)
      page = request('/'+user)
      desc = page.parser.at('meta[@name="description"]')
        user = [
          :description => desc ? desc[:content] : nil,
          :avatar => page.parser.xpath("//a[@class='avatar']//img").first['src'],
          :books => extract_books(page)
        ]
      response(user)
    end
    
    def now_reading(user)
      page = request("/#{user}/lists/NowReading")
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
end
