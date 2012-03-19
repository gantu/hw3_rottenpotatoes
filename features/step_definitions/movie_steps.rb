
# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create!(:title=>movie[:title],:rating=>movie[:rating],:release_date=>movie[:release_date],:description=>movie[:more_info])
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
  end
  
end

When /^I check the ratings "(.*)"/ do |arg1|
  arg1.split(',').each do |rating|
		 check("ratings_#{rating}")
	end
end

And /^I uncheck all ratings except "(.*)"/ do |arg1|
       all_r=Movie.all_ratings
       except=arg1.split(',')
       intersect=all_r-except
       intersect.each do |rating|
		uncheck("ratings_#{rating}")
	end
end

When /^I click Refresh button$/ do
  click_button "Refresh"
end


Then(/^I should see (.+) table$/) do |table_id, expected_table|
  html_table = table_at("#movies").to_a
  html_table.map! { |r| r.map! { |c| c.gsub(/<.+?>/, '').gsub(/[\n\t\r]/, '') } }
  expected_table.diff!(html_table)
end

Then /^I do not see movies except ratings "(.*)"$/ do |arg1|
  Movie.all_ratings-arg1.split(',').each do |r|
	within_table('movies') do
		page.has_xpath?('.//td[2]', :text => r, :count =>0)
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

