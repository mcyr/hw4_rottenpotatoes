require 'spec_helper'

describe MoviesController do
  before :each do
      @movie = Movie.create!(:title => 'Star Wars', :rating => 'PG', :director => 'George Lucas', :release_date => '1977-05-25')   
      @movie2 = Movie.create!(:title => 'THX-1138', :rating => 'R', :director => 'George Lucas', :release_date => '1971-03-11') 
      @movie3 = Movie.create!(:title => 'Alien', :rating => 'R', :director => '', :release_date => '1979-05-25') 

  end

  describe 'Find Movies With Same Director' do
    it 'should call the model method that performs the search' do
      Movie.stub(:find_movies).and_return(@movie)
      get :search_same_director, :id => @movie.id
      assigns(:movies).should == @movie
    end
    it 'should select the Search Results template for rendering' do
      Movie.stub(:find_movies).and_return(@movie)
      get :search_same_director, :id => @movie.id
      response.should render_template('search_same_director')
    end
    it 'should make the search results available to that template' do
      get :search_same_director, :id => @movie.id
      assigns(:movies).should include @movie2
    end
    it 'should redirect to home page if no director info' do
      Movie.stub(:find_movies).and_return(@movie3)
      get :search_same_director, :id => @movie3.id
      #response.should redirect_to(:action => "index")
      response.should redirect_to(movies_path)
      flash[:warning].should eql("'#{@movie3.title}' has no director info")
    end
  end
end
