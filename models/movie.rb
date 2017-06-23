class Movie
  def parse_movies
    movie = MovieLoader.new
    file = File.read('movie_list.json')
    @movie_info = JSON.parse(file)
    @movie_info.each do |mov|

    end
  end

  def movie_time
    @movie_info.each do |mov|
      puts mov["time"].split("")
    end
  end





end