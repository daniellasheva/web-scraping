require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './post.rb'

class Scraper

  def get_page
   doc = Nokogiri::HTML(open("http://awanderingreader.com/"))
 end


 def get_post_info
   post_dates=get_page.css(".post-info .thetime")
   post_dates.collect do |date|
       @post=Post.new
       @post.date=date.text
       @post.title=print_post_titles(post)
   end
    @post=print_post_titles(@post)
    binding.pry
 end


  def make_post_titles
   posts=[]
   post_titles=get_page.css(".post.excerpt .title")
   post_titles.collect do |title|
      post=Post.new
      post.title= title.text.strip
      posts<<post
      #puts post.title
   end
   posts
   binding.pry
 end

 def get_post
   post= get_page.css(".post.excerpt")
end


  #post_titles = self.get_page.css(".post.excerpt .title")

# def make_titles
#   self.print_post_titles.each do |title|
#     binding.pry
#     post.title = title
#   end
# end
#
# def make_dates
#   self.get_post_dates.each do |date|
#     post.date = date
#   end
# end

end

scraper= Scraper.new
puts scraper.make_post_titles
#Scraper.new.make_titles
