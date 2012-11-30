require 'spec_helper'

describe Movie do
  describe 'searching movies by director' do
    it 'should call db with title keywords' do
      #Movie.should_receive(:find).
      Movie.should_receive(:find_movies).
        with(:title => 'Star Wars')
      Movie.find_movies({:title=>"Star Wars"})
    end
=begin
    it 'should raise an InvalidKeyError with no API key' do
      lambda { Movie.find_in_tmdb('Inception') }.
        should raise_error(Movie::InvalidKeyError)
    end
=end
  end
end
