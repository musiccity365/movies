class API
    def self.fetch_movies
        url = 'https://ghibliapi.herokuapp.com/films'
        uri = URI(url)
        response = Net::HTTP.get(uri)
        array_of_movies = JSON.parse(response)
        array_of_movies.each do |movie_hash|
            movie = Movie.new(movie_hash["title"], movie_hash["director"], movie_hash["producer"], movie_hash["release_date"], movie_hash["rt_score"], movie_hash["description"])
            # movie.title = movie_hash["title"]
            # movie.director = movie_hash["director"]
            # movie.producer = movie_hash["producer"]
            # movie.release_date = movie_hash["release_date"]
            # movie.rt_score = movie_hash["rt_score"]
            # movie.description = movie_hash["description"]
        end
    end
end