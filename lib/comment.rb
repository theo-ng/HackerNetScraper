class Comment

  attr_reader :item_id, :username, :text, :post_date

  def initialize(comment)
    @username = find_username(comment)
    @item_id = find_id(comment)
    @post_date = find_post_date(comment)
    @text = find_text(comment)
  end

  private
  def find_username(comment)
    comment.css('span.comhead > a:first-child').text
  end

  def find_id(comment)
    comment.css('span.comhead > a')[1]['href'].match(/\d+/).to_s
  end

  def find_post_date(comment)
    comment.css('span.comhead > a:nth-child(2)').text
  end

  def find_text(comment)
    comment.css('span.comment').text
  end

end