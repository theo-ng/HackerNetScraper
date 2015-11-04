class Post

  attr_reader :title, :url, :points, :item_id

  def initialize(post)
    @title = find_title(post)
    @url = find_url(post)
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
    post.css('td:nth-child(3) > a').text
  end

  def find_url(post)
    post.css('span.sitebit.comhead > a > span').text
  end

  def find_points(post)
    post.css('.score').text
  end

  def find_id(post)
    post.css('.subtext > a')[1]['href'].match(/\d+/).to_s
  end

  def find_comments(post)
    post.css('td.default').each { |comment| add_comment(Comment.new(comment)) }
  end

end