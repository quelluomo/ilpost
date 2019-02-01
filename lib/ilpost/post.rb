class Ilpost::Post
  attr_accessor :title, :section, :url, :subtitle

  def self.articles
    articles = []
    articles << self.scraper
    articles
  end

#  def self.scraper
#    doc = Nokogiri::HTML(open("https://www.ilpost.it/"))
#    article.title = doc.css("div.entry-content h2.entry-title a").text
#    article.subtitle = doc.css("div.entry-content p").text.strip
#    article.url = doc.css("div.entry-content h2.entry-title a").attr("href")
    #binding.pry
#    article
#  end #scraper

def self.scraper
  doc = Nokogiri::HTML(open("https://www.ilpost.it/"))

  articles = []
  i = 0
  doc.css("div.entry-content").each do |article|
  article = {}
  article[:title] = doc.css("h2.entry-title a:nth-child(#{i})").text
  article[:subtitle] = doc.css("p:nth-child(#{i})").text.strip
  article[:url] = doc.css("h2.entry-title a:nth-child(#{i})").attr("href")
  articles << article
  i+=1
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
