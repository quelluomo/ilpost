class Ilpost::Post
  attr_accessor :title, :section, :url, :subtitle

  def self.articles
    articles = []
    articles << self.scraper
    articles
  end

  def self.scraper
    doc = Nokogiri::HTML(open("https://www.ilpost.it/"))
    article = self.new
    article.title = doc.css("div.entry-content h2.entry-title a").first.text
    article.subtitle = doc.css("div.entry-content p").first.text.strip
    article.url = doc.css("div.entry-content h2.entry-title a").first.attr("href")
    #binding.pry
    article
  end #scraper

end #class

# article is a new instance of Post
# article has a title
#articles is an array with many instances of the Post class
