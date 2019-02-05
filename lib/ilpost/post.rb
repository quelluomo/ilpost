class Ilpost::Post
  attr_accessor :title, :section, :url, :subtitle

  def self.news
    self.scraper
  end

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
end
  articles
  #binding.pry
end #scraper

def self.section(url)
  page = Nokogiri::HTML(open("https://www.ilpost.it/#{url}"))
  articles = []
  home = page.css("article")
  home.css("div.entry-content").collect do |news|
  title = news.css("h2.entry-title a").text
  subtitle = news.css("p").text.strip
  url = news.css("h2.entry-title a").attr("href").text

  article_hash = {:title => title, :subtitle => subtitle, :url => url}
  articles << article_hash
end
  articles
end #scraper

end #class
