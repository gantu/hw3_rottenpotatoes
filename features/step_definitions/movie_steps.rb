# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
  end
  #assert false, "Unimplmemented"
end

When /^I check the ratings "(.*)"/ do |arg1|
  arg1.split(',').each do |rating|
		 check("ratings_#{rating}")
	end
end

And /^I uncheck all ratings except "(.*)"/ do |arg1|
	Movie.all_ratings-arg1.split(',').each do |rating|
		uncheck("ratings_#{rating}")
	end
end

When /^I click Refresh button$/ do
  click_button "Refresh"
end

Then /^I see "(.*)" and "(.*)" rated movies$/ do |arg1,arg2|
    pg=arg1.split(',')
    r=arg2.split(',')
    within_table('movies') do
      page.has_xpath?("//tr", :text => pg[1], :count => pg[0])
      page.has_xpath?("//tr", :text => r[1], :count => r[0])
    end
end

Then /^I do not see movies except ratings "(.*)"$/ do |arg1|
  Movie.all_ratings-arg1.split(',').each do |r|
	within_table('movies') do
		page.has_xpath?("//tr", :text => r, :count => 0)
	end
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page




Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.content  is the entire content of the page as a string.
  assert false, "Unimplmemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
end

