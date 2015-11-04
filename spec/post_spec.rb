require_relative 'spec_helper'

describe Post do

  before :each do
    file = Nokogiri::HTML(open("post.html"))
    @post = Post.new(file)
  end

  describe "#initialize" do

    it "should initialize a post object" do
      expect(@post).to be_an_instance_of(Post)
    end

    it "should have a title" do 
      expect(@post.title).to eq("Show HN: Velocity.js – Accelerated JavaScript animation")
    end
  end

end