class Movie
    attr_accessor :title, :director, :producer, :release_date, :rt_score, :description
    
    @@all = []

    def initialize(title, director, producer, release_date, rt_score, description)
        @title = title
        @director = director
        @producer = producer 
        @release_date = release_date
        @rt_score = rt_score
        @description = description
        @@all << self
    end

    def self.all
        @@all
    end

    def self.sort_title_asc
        self.all.sort do |a, b| 
            a.title <=> b.title 
        end
    end
       
    def self.sort_title_desc
        self.all.sort do |a, b| 
            b.title <=> a.title 
        end
    end

    def self.sort_rt_score_asc
        self.all.sort do |a, b| 
            a.rt_score.to_f <=> b.rt_score.to_f 
        end
    end

    def self.sort_rt_score_desc
        self.all.sort do |a, b| 
            b.rt_score.to_f <=> a.rt_score.to_f 
        end
    end
end