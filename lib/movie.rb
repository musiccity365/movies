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
                    
    # sort_by rt_score method - highest score & lowest score (ascending & descending)
end