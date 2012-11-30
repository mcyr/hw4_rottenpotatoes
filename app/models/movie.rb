class Movie < ActiveRecord::Base

  def self.find_movies(id)
    begin
      #puts("in Movie.rb; find_movies: id=#{id}")
      m = Movie.find_by_id(id)
      #puts("m.director=#{m.director}");
      @movies = Movie.find_all_by_director(m.director)
    end
  end


  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
end
