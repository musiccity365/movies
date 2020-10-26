class CLI

    # ALL CLI METHODS ARE INSTANCE METHODS

    def start
        puts "\n"
        puts "Welcome to the movie list app"
        API.fetch_movies # grabs info from API and creates instances
        self.menu # CLI INSTANCE
    end

    def menu 
        # give user the option to see list of movies
        puts "\n"
        puts "Would you like to see the list of movies?"
        puts "\n"
        puts "Type 'yes' or 'y' to continue or any other key to exit"

        user_input = gets.strip.downcase

        # if the user says yes
        if user_input == "yes" || user_input == "y"
            puts "Enter the selection of how you wish to view the list of movies!"

            # CASE STATEMENT ?

                # display a complete list of movies - move display_list_of_movies instance method up here

                # sort_by release_date method - most recent year & oldest year (ascending & descending)
            
                # sort_by title method - alphabetically (ascending & descending)
        
                # sort_by rt_score method - highest score & lowest score (ascending & descending)

                # select movies with same directors and producers

                # select movies produced within the same year

            # display the list
            display_list_of_movies # instance method
            ask_user_for_movie_choice

            sleep(2)
            
            menu # recursion - this is when a method is called within itself. In this case, the menu starts over again.
        else
            puts "Goodbye!"    
        end
    end

    def display_list_of_movies
        # Access all the movies
        # binding.pry
        # print each one out
        puts "\n"
        Movie.all.each.with_index(1) do |movie, index| 
            puts "#{index}. #{movie.title}"
        end
    end

    def ask_user_for_movie_choice
        # ask_user_for_movie_choice
        puts "\n"
        puts "Enter the number of the movie you'd like to know more about"
        index = gets.strip.to_i - 1

        # index valid? number between 0 and 19
        until index.between?(0, Movie.all.length - 1)
            # keep asking for user input
            puts "\n"
            puts "Invalid entry! Please choose a valid number"
            index = gets.strip.to_i - 1
        end

        movie_instance = Movie.all[index]
        # puts movie_instance.title - USE THIS FOR TESTING PURPOSES
        display_movie_details(movie_instance)
        # binding.pry

    end

    def display_movie_details(movie)
        # binding.pry
        sleep(1)
        puts "\n"
        puts "Title: " + movie.title
        puts "Director: " + movie.director
        puts "Producer: " + movie.producer
        puts "Release Date: " + movie.release_date
        puts "Score: " + movie.rt_score
        puts "Description: \n" + movie.description
    end
    
    # OPTIONAL METHODS FOR USER INPUT

    # sort_by release_date method
    # def ask_user_for_release_date
    #     puts "Enter the list number for the year in which you'd like to see a list of movies"
    #     index = gets.strip.to_i - 1
        
    #     # index valid? number between 0 and 
    #     until index.between?(0, Movie.release_date.length - 1)
    #         # keep asking for user input
    #         puts "Invalid entry! Please choose a valid number"
    #         index = gets.strip.to_i - 1
    #     end
        
    #         movie_instance = Movie.all[index]
        
    #         display_movie_by_release_date(movie_instance)
    # end

    # def display_list_of_movies_by_release_date(movie)
    #     # Access all the movies
    #     # binding.pry
    #     # print each one out
    #     Movie.all.each.with_index(1) do |movie, index| 
    #         puts "#{index}. #{movie.release_date}"
    #     end
    # end

    # sort_by release_date method - most recent year & oldest year (ascending & descending)
                    
    # sort_by title method - alphabetically (ascending & descending)
                
    # sort_by rt_score method - highest score & lowest score (ascending & descending)

    # select movies with same directors and producers

    # select movies produced within the same year
end