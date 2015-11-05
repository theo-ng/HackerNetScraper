class Post

  class FormatError < StandardError
  end

  attr_reader :title, :url, :points, :item_id, :user

  def initialize(post)
    @title = find_title(post)
    @url = find_url(post)
    @user = find_user(post)
    @points = find_points(post)
    @item_id = find_id(post)
    @comments = []
    find_comments(post)
  end

  def comments
    @comments
  end

  def add_comment(comment)
    comments << comment
  end

  private
  def find_title(post)
    title = post.css('td:nth-child(3) > a').text
    raise FormatError, "Title formatting changed" if title.empty?
    title
  end

  def find_user(post)
    user = post.css('.subtext > a')[0].text
    raise FormatError, "User formatting changed" if user.empty?
    user
  end

  def find_url(post)
    url = post.css('td.title > a')[0]['href']
    raise FormatError, "URL formatting changed" if url.empty?
    url
  end

  def find_points(post)
    points = post.css('.score').text
    raise FormatError, "Points formatting changed" if points.empty?
    points
  end

  def find_id(post)
    id = post.css('.subtext > a')[1]['href'].match(/\d+/).to_s
    raise FormatError, "ID formatting changed" if id.empty?
    id
  end

  def find_comments(post)
    post.css('td.default').each { |comment| add_comment(Comment.new(comment)) }
  end

end