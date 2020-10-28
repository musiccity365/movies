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
        puts "MAIN MENU - Please enter a selection number (0-4) from the list below to continue or type any other key to exit, then press enter/return!"
        user_input = gets.strip.downcase.to_i
        puts "To view a list of movies in ascending alphabetical order, press 1"
        puts "To view a list of movies in descending alphabetical order, press 2"
        puts "To view a list of movies by rating in ascending order, press 3"
        puts "To view a list of movies by rating in descending order, press 4"
        case user_input
        when 0
            # display the list
            display_list_of_movies # instance method
            ask_user_for_movie_choice
            sleep(2)
            menu # recursion - this is when a method is called within itself. In this case, the menu starts over again.
        when 1
            display_sorted_title_asc
            sleep(2)
            menu 
        when 2
            display_sorted_title_desc
            sleep(2)
            menu 
        when 3
            display_sorted_rt_score_asc
            sleep(2)
            menu 
        when 4
            display_sorted_rt_score_desc
            sleep(2)
            menu 
        else
            puts "Goodbye!"
        end  
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
        puts "\n"
        Movie.sort_title_asc.each.with_index(1) do |movie, index| 
            # binding.pry
            puts "#{index}. #{movie.title}"
        end
    end

    def display_sorted_title_desc
        puts "\n"
        Movie.sort_title_desc.each.with_index(1) do |movie, index| 
            # binding.pry
            puts "#{index}. #{movie.title}"
        end
    end

    def display_sorted_rt_score_asc
        puts "\n"
        Movie.sort_rt_score_asc.each.with_index(1) do |movie, index| 
            # binding.pry
            puts "#{index}. #{movie.title} - " + movie.rt_score
        end
    end

    def display_sorted_rt_score_desc
        puts "\n"
        Movie.sort_rt_score_desc.each.with_index(1) do |movie, index| 
            # binding.pry
            puts "#{index}. #{movie.title} - " + movie.rt_score
        end
    end
end