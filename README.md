This gem uses [mechanize](https://github.com/tenderlove/mechanize) to scrape content from [shelfari.com](http://www.shelfari.com) and simulate an API, because currently there is no official one. Given the nature of obtaining the data, things might break often, so use at your own risk.

## Methods ##
	
	book(id) - returns information about a book based on id


## Instalation ##
  
	gem install shelfari

## Usage ##

	require 'shelfari'
	
	library = Shelfari.new
	myBook = library.book(5831441)

	puts myBook
	=>[{"bookid":"5831441",
	    "editionid":"7405802",
        "title":"The Girl Who Kicked the Hornet's Nest",
        "link":"http://www.shelfari.com/books/5831441/The-Girl-Who-Kicked-the-Hornets-Nest"}]

## License ##

This library is distributed under the MIT license.  Please see the LICENSE file.