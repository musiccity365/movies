class CLI

    def start
        puts ""
        puts "Welcome to the movie list app"
        API.fetch_movies 
        self.menu 
    end

    def menu 
        puts ""
        puts "---------------MAIN MENU--------------"
        puts ""
        puts "Please enter a selection number (1-5) from the list below to continue or type any other key to exit, then press enter/return!"
        puts ""
        puts "1. To view a complete list of movies"
        puts "2. To view a complete list of movies in ascending alphabetical order"
        puts "3. To view a complete list of movies in descending alphabetical order"
        puts "4. To view a complete list of movies by rating in ascending order"
        puts "5. To view a complete list of movies by rating in descending order"
        puts ""
        user_input = gets.strip.to_i
        case user_input
        when 1
            display_list_of_movies 
            ask_user_for_movie_choice
            sleep(2)
            menu 
        when 2
            display_sorted_title_asc
            sleep(2)
            menu 
        when 3
            display_sorted_title_desc
            sleep(2)
            menu 
        when 4
            display_sorted_rt_score_asc
            sleep(2)
            menu 
        when 5
            display_sorted_rt_score_desc
            sleep(2)
            menu 
        else
            puts ""
            puts "Thank you, Goodbye!"
            puts ""
        end  
    end

    def display_list_of_movies
        puts ""
        puts "---------------COMPLETE MOVIE LIST--------------"
        puts ""
        Movie.all.each.with_index(1) do |movie, index| 
            puts "#{index}. #{movie.title}"
        end
    end

    def ask_user_for_movie_choice
        puts ""
        puts "Enter the number of the movie you'd like to know more about, then press enter/return!"
        puts ""
        index = gets.strip.to_i - 1
        
        until index.between?(0, Movie.all.length - 1)
            puts ""
            puts "Invalid entry! Please choose a valid number, then press enter/return!"
            puts ""
            index = gets.strip.to_i - 1
        end
        movie_instance = Movie.all[index]
        display_movie_details(movie_instance)
    end

    def display_movie_details(movie)
        sleep(1)
        puts ""
        puts "Title: " + movie.title
        puts "Director: " + movie.director
        puts "Producer: " + movie.producer
        puts "Release Date: " + movie.release_date
        puts "Score: " + movie.rt_score
        puts "Description: \n" + movie.description
    end

    def display_sorted_title_asc
        puts ""
        puts "---------------MOVIE LIST WITH TITLES ASCENDING--------------"
        puts ""
        Movie.sort_title_asc.each.with_index(1) do |movie, index| 
            puts "#{index}. #{movie.title}"
        end
    end

    def display_sorted_title_desc
        puts ""
        puts "---------------MOVIE LIST WITH TITLES DESCENDING--------------"
        puts ""
        Movie.sort_title_desc.each.with_index(1) do |movie, index| 
            puts "#{index}. #{movie.title}"
        end
    end

    def display_sorted_rt_score_asc
        puts ""
        puts "---------------MOVIE LIST WITH SCORES ASCENDING--------------"
        puts ""
        Movie.sort_rt_score_asc.each.with_index(1) do |movie, index| 
            puts "#{index}. #{movie.title} - " + movie.rt_score
        end
    end

    def display_sorted_rt_score_desc
        puts ""
        puts "---------------MOVIE LIST WITH SCORES DESCENDING--------------"
        puts ""
        Movie.sort_rt_score_desc.each.with_index(1) do |movie, index| 
            puts "#{index}. #{movie.title} - " + movie.rt_score
        end
    end
end