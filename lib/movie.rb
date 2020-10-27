class Movie
    attr_accessor :title, :director, :producer, :release_date, :rt_score, :description
    
    @@all = []

    def initialize
        @@all << self
    end

    def self.all
        @@all
    end

    # OPTIONAL METHODS FOR USER INPUT

    # sort_by title method - alphabetically (ascending & descending)
    def sort_by_title(title)
        self.all.select { |i| i.sort 
            puts i 
            
            binding.pry
            
        }
    end
                    
    # sort_by rt_score method - highest score & lowest score (ascending & descending)
end