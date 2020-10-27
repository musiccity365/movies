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
    def self.sort_title_asc
        self.all.sort do |a, b| 
            a.title <=> b.title 
            
            binding.pry
            
        end
    end
       
    def sort_title_desc(array)
        array.sort { |a, b| b.title <=> a.title } 
    end
    # sort_by rt_score method - highest score & lowest score (ascending & descending)
    def sort_score_asc(array)
        array.sort { |a, b| a.rt_score <=> b.rt_score }
    end

    def sort_score_desc(array)
        array.sort { |a, b| b.rt_score <=> a.rt_score }
    end
end