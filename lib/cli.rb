class CLI

    def start
        puts "Welcome"
        API.fetch_movies
    end
end