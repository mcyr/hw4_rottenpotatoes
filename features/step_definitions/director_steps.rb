# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create!(movie)
  end
end

Then /^the director of "([^"]*)" should be "([^"]*)"$/ do |arg1, arg2|
  mov = Movie.where("title = '#{arg1}'")
  #puts("mov=#{mov}")
  #puts(mov.size)
  mov.each do |m|
    m.director.should == arg2
  end
end

