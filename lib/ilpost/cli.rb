#cli controller

class Ilpost::CLI

  def call
    hello
    menu
  end

  def hello
    puts "Benvenuto!"
  end

  def list_home
    puts "Ecco i titoli de Il Post:".colorize(:green)
    puts "-------------------------".colorize(:green)
    articles = Ilpost::Post.news
    articles.each.with_index(1) do |article, index|
      puts "#{index}. #{article[:title]}".colorize(:blue)
      puts "   #{article[:subtitle]}"
      puts "   #{article[:url]}".colorize(:red)
    end
  end

  def list_section(url)
    puts "Ecco i titoli della sezione #{url.capitalize}:".colorize(:green)
    puts "---------------------------------------------".colorize(:green)
    articles = Ilpost::Post.section(url)
    articles.each.with_index(1) do |article, index|
      puts "#{index}. #{article[:title]}".colorize(:blue)
      puts "   #{article[:subtitle]}"
      puts "   #{article[:url]}".colorize(:red)
    end
  end

  def menu
    input = nil
    while input != "esci"
      puts "Digita 'home' per i titoli principali."
      puts "Digita 'esci' per uscire o digita una delle seguenti sezioni:"
      puts "home - italia - mondo - politica - tecnologia - internet - scienza - cultura - economia - sport - media - moda - libri - auto - video \n".colorize(:yellow)
      input = gets.strip.downcase

      if input == "home"
        self.list_home
      elsif input == "italia"
        self.list_section(input)
      elsif input == "mondo"
        self.list_section(input)
      elsif input == "politica"
        self.list_section(input)
      elsif input == "tecnologia"
        self.list_section(input)
      elsif input == "internet"
        self.list_section(input)
      elsif input == "scienza"
        self.list_section(input)
      elsif input == "cultura"
        self.list_section(input)
      elsif input == "economia"
        self.list_section(input)
      elsif input == "sport"
        self.list_section(input)
      elsif input == "media"
        self.list_section(input)
      elsif input == "moda"
        self.list_section(input)
      elsif input == "libri"
        self.list_section(input)
      elsif input == "auto"
        self.list_section(input)
      elsif input == "video"
        self.list_section(input)
      elsif input =="esci"
        puts "Arrivederci e a presto!"
        break
      else
        puts "Mi spiace, non ho capito.".colorize(:red)
      end
    end
  end

end
