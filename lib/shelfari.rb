$:.unshift File.dirname(__FILE__)

require 'mechanize'
require 'json'
require 'shelfari/api'

module Shelfari
  def self.new
    Shelfari::API.new
  end
end
