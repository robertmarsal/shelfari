[![Build Status](https://travis-ci.org/robertboloc/shelfari.png)](https://travis-ci.org/robertboloc/shelfari)
[![Code Climate](https://codeclimate.com/github/robertboloc/shelfari.png)](https://codeclimate.com/github/robertboloc/shelfari)
[![Gem Version](https://badge.fury.io/rb/shelfari.png)](http://badge.fury.io/rb/shelfari)

This gem uses [mechanize](https://github.com/tenderlove/mechanize) to scrape content from [shelfari.com](http://www.shelfari.com) and simulate an API, because currently there is no official one. Given the nature of obtaining the data, things might break often, so use at your own risk.

#### Methods
```ruby
book_by_id(id) #returns information about a book based on id
book_by_isbn(isbn) #returns information about a book based on isbn
user(username) #returns user details
now_reading(username) #returns the books the user is currently reading
```
#### Installation
```ruby
gem install shelfari
```
#### Usage
```ruby
require 'shelfari'
    
library = Shelfari.new
```
Get info about a book
```ruby
myBook = library.book_by_id(5831441)
```
This returns the following JSON
```json
{    
    "bookid": "5831441",
    "editionid": "7405802",
    "title": "The Girl Who Kicked the Hornet's Nest",
    "author": "Stieg Larsson",
    "cover": "http://ecx.images-amazon.com/images/I/41BHhplwx0L._SL236.jpg",
    "url": "http://www.shelfari.com/books/5831441/The-Girl-Who-Kicked-the-Hornets-Nest"
}
```

#### License

This library is distributed under the MIT license.  Please see the LICENSE file.
