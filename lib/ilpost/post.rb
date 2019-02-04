class Ilpost::Post
  attr_accessor :title, :section, :url, :subtitle

  #def self.news
  #  news = []
  #  news << self.scraper
  #  news
#  end

#  def self.scraper
#    doc = Nokogiri::HTML(open("https://www.ilpost.it/"))
#    article.title = doc.css("div.entry-content h2.entry-title a").text
#    article.subtitle = doc.css("div.entry-content p").text.strip
#    article.url = doc.css("div.entry-content h2.entry-title a").attr("href")
    #binding.pry
#    article
#  end #scraper

def self.post_homepage
  Nokogiri::HTML(open("https://www.ilpost.it/"))
end

def self.scraper
  articles = []
  home = self.post_homepage.css("article")
  home.css("div.entry-content").collect do |news|
  title = news.css("h2.entry-title a").text
  subtitle = news.css("p").text.strip
  url = news.css("h2.entry-title a").attr("href").text

  article_hash = {:title => title, :subtitle => subtitle, :url => url}
  articles << article_hash
  #binding.pry
end
  articles
end #scraper



end #class

# article is a new single instance of Post
# post has all the title attributes
# and all the subtitle attributes
# how do I get the first title attribute linked to the first subtitle?

# article has a title //

#articles is an array with many instances of the Post class
