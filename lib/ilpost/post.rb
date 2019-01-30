class Ilpost::Post
  attr_accessor :title, :section, :url

  def self.articles
    articles = []
    articles << self.scraper
    articles
  end

  def self.scraper
    doc = Nokogiri::HTML(open("https://www.ilpost.it/"))

    article = self.new
    article.title = doc.css("div.h2.entry-title a.title").text.strip
    article.subtitle = doc.css("div.h2.p a.title").text.strip
    #article.url =
    article
  end #scraper

end #class
