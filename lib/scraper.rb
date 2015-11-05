require 'byebug'
require 'nokogiri'
require 'open-uri'
require 'colorize'
require_relative 'post'
require_relative 'comment'

class Scraper

  class InvalidPathError < StandardError
  end

  def main(url)
    raise InvalidPathError unless url[0].match(/^http/) || url[0].match(/\.html$/)
    html = open(url[0])
    doc = Nokogiri::HTML(html.read)
    doc.encoding = 'utf-8'
    post = Post.new(doc)
    print_info(post)
  end

  private
  def print_info(post)
    puts format_post(post)
  end

  def format_post(post)
    output = "------------------\n" + 
    "Post title: #{post.title.colorize(:red)}\n" + 
    "User: #{post.user.colorize(:cyan)}\n" +
    "Link: #{post.url.colorize(:light_black)}\n" +
    "Points: #{post.points.colorize(:green)}, ID: #{post.item_id.colorize(:light_magenta)}\n" +
    "Number of comments: " + "#{post.comments.size}\n".colorize(:light_blue) +
    "------------------"
  end
end

if $0 == __FILE__
  Scraper.new.main(ARGV)
end