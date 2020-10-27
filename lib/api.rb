class API
    # all APIs should be class methods
    def self.fetch_movies
        url = 'https://ghibliapi.herokuapp.com/films'
        uri = URI(url)
        response = Net::HTTP.get(uri) # => String
        array_of_movies = JSON.parse(response)
        
        ## NOTE: MAKE INSTANCES OF API DATA!!!
        # title -  name
        # director - name
        # producer - name
        # release_date - integer
        # rt_score - float
        # description - info
        # :title, :director, :producer, :release_date, :rt_score, :description
        
        array_of_movies.each do |movie_hash|
            movie = Movie.new
            movie.title = movie_hash["title"]
            movie.director = movie_hash["director"]
            movie.producer = movie_hash["producer"]
            movie.release_date = movie_hash["release_date"]
            movie.rt_score = movie_hash["rt_score"]
            movie.description = movie_hash["description"]
        end
        # binding.pry
    end
end