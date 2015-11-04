require 'byebug'
require 'nokogiri'
require 'open-uri'
require_relative 'post'
require_relative 'comment'

class Scraper

  class << self
    def main(url)
      html = open(url[0])
      doc = Nokogiri::HTML(html.read)
      doc.encoding = 'utf-8'
      post = Post.new(doc)
      # byebug
      print_info(post)
    end

    private
    def print_info(post)
      puts format_post(post)
    end

    def format_post(post)
      output = "------------------\n" + 
      "Post title: #{post.title}\n" + 
      "Link: #{post.url}\n" +
      "Points: #{post.points}, ID: #{post.item_id}\n" +
      "Number of comments: #{post.comments.size}\n" +
      "------------------"
    end
  end
end

if $0 == __FILE__
  Scraper.main(ARGV)
end