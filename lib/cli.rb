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
        puts "Enter a selection number from the list below to continue or type any other key to exit, then press enter/return!"

        user_input = gets.strip.downcase.to_i

        # if the user says yes
        case user_input
        when 0
            puts "Enter the selection of how you wish to view the list of movies, then press enter/return!"
            # display the list
            display_list_of_movies # instance method
            ask_user_for_movie_choice
            sleep(2)
            menu # recursion - this is when a method is called within itself. In this case, the menu starts over again.
        when 1
            display_sorted_title_asc
        else
            puts "Goodbye!"
        end 

            # CASE STATEMENT ?

                # display a complete list of movies - move display_list_of_movies instance method up here

                # sort_by title method - alphabetically (ascending & descending) - create this in movie class
        
                # sort_by rt_score method - highest score & lowest score (ascending & descending) - create this in movie class


        
    end

    def display_list_of_movies
        # Access all the movies
        # print each one out
        puts "\n"
        Movie.all.each.with_index(1) do |movie, index| 
            # binding.pry
            puts "#{index}. #{movie.title}"
        end
    end

    def ask_user_for_movie_choice
        # ask_user_for_movie_choice
        puts "\n"
        puts "Enter the number of the movie you'd like to know more about, then press enter/return!"
        index = gets.strip.to_i - 1

        # index valid? number between 0 and 19
        until index.between?(0, Movie.all.length - 1)
            # keep asking for user input
            puts "\n"
            puts "Invalid entry! Please choose a valid number, then press enter/return!"
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

    def display_sorted_title_asc
        Movie.sort_title_asc
        binding.pry
    end
end