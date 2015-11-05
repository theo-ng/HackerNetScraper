require_relative 'spec_helper'

describe Post do

  before :each do
    html = open("post.html")
    doc = Nokogiri::HTML(html.read)
    doc.encoding = 'utf-8'
    @post = Post.new(doc)
  end

  describe "#initialize" do

    it "should initialize a post object" do
      expect(@post).to be_an_instance_of(Post)
    end

    it "should have the title" do 
      expect(@post.title).to eq("Show HN: Velocity.js – Accelerated JavaScript animation")
    end

    it "should have the url" do 
      expect(@post.url).to eq("http://VelocityJS.org")
    end

    it "should have the user" do 
      expect(@post.user).to eq("purpleturtle")
    end

    it "should have the point total" do 
      expect(@post.points).to eq("160 points")
    end

    it "should have the id" do 
      expect(@post.item_id).to eq("7663775")
    end

  end

  describe "#comments" do

    it "should return an array of 49 comments" do 
      expect(@post.comments.size).to be(49)
    end

  end

end