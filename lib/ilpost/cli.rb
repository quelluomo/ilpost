#cli controller

class Ilpost::CLI

  def call
    list_home
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

  def menu
    input = nil
    while input != "esci"
      puts "Seleziona un numero per aprire l'articolo, o digita: \n
      per vedere più titoli: avanti \n
      per uscire: esci \n
      o digita una delle seguenti sezioni: \n
      italia - mondo - politica - tecnologia - internet \n
      scienza - cultura - economia - sport - media \n
      moda - libri - auto - video \n"
      input = gets.strip.downcase

    end
  end

end
