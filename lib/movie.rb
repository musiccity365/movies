class Movie
    attr_accessor :title, :director, :producer, :release_date, :rt_score, :description
    
    @@all = []

    def initialize
        @@all << self
    end

    def self.all
        @@all
    end

    def self.sort_title_asc
        self.all.sort do |a, b| 
            a.title <=> b.title 
            # binding.pry
        end
    end
       
    def self.sort_title_desc
        self.all.sort do |a, b| 
            b.title <=> a.title 
            # binding.pry
        end
    end

    def self.sort_rt_score_asc
        self.all.sort do |a, b| 
            a.rt_score <=> b.rt_score 
        end
    end

    def self.sort_rt_score_desc
        self.all.sort do |a, b| 
            b.rt_score <=> a.rt_score 
        end
    end
end