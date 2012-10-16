[![Build Status](https://travis-ci.org/robertboloc/shelfari.png)](https://travis-ci.org/robertboloc/shelfari)

This gem uses [mechanize](https://github.com/tenderlove/mechanize) to scrape content from [shelfari.com](http://www.shelfari.com) and simulate an API, because currently there is no official one. Given the nature of obtaining the data, things might break often, so use at your own risk.

#### Methods
```ruby    
book(id) #returns information about a book based on id
search(title) #returns the first page of results
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
myBook = library.book(5831441)

puts myBook

=>[
    {    
        "bookid": "5831441",
        "editionid": "7405802",
        "title": "The Girl Who Kicked the Hornet's Nest",
        "author": "Stieg Larsson",
        "cover": "http://ecx.images-amazon.com/images/I/41BHhplwx0L._SL236.jpg",
        "url": "http://www.shelfari.com/books/5831441/The-Girl-Who-Kicked-the-Hornets-Nest"
    }
  ]
```
Search a book
```ruby
mySearch = library.search('the girl with the dragon tatoo')

puts mySearch

=>{
"3542641": [
    {
        "bookid": "3542641",
        "title": "The Girl with the Dragon Tattoo",
        "url": "http://www.shelfari.com/books/3542641/The-Girl-with-the-Dragon-Tattoo"
    }
],
"14750831": [
    {
        "bookid": "14750831",
        "title": "Stieg Larsson's Millennium Trilogy Bundle",
        "url": "http://www.shelfari.com/books/14750831/Stieg-Larssons-Millennium-Trilogy-Bundle"
    }
],
"4039394": [
    {
        "bookid": "4039394",
        "title": "The Girl Who Played with Fire",
        "url": "http://www.shelfari.com/books/4039394/The-Girl-Who-Played-with-Fire"
    }
],
"5831441": [
    {
        "bookid": "5831441",
        "title": "The Girl Who Kicked the Hornet's Nest",
        "url": "http://www.shelfari.com/books/5831441/The-Girl-Who-Kicked-the-Hornets-Nest"
    }
],
"24081517": [
    {
        "bookid": "24081517",
        "title": "Girl with the Temporary Tattoo",
        "url": "http://www.shelfari.com/books/24081517/Girl-with-the-Temporary-Tattoo"
    }
],
"22871867": [
    {
        "bookid": "22871867",
        "title": "The Psychology of the Girl With the Dragon Tattoo",
        "url": "http://www.shelfari.com/books/22871867/The-Psychology-of-the-Girl-With-the-Dragon-
                Tattoo"
    }
],
"25520226": [
    {
        "bookid": "25520226",
        "title": "The Girl with the Dragon Tattoo (A BookCaps Study Guide)",
        "url": "http://www.shelfari.com/books/25520226/The-Girl-with-the-Dragon-Tattoo-
                (A-BookCaps-Study-Guide)"
    }
]
}
```

#### License

This library is distributed under the MIT license.  Please see the LICENSE file.
