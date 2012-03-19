Feature: display list of movies filtered by MPAA rating
 
  As a concerned parent
  So that I can quickly browse movies appropriate for my family
  I want to see movies matching only certain MPAA ratings

Background: movies have been added to database

  Given the following movies exist:
  | title                   | rating 	| release_date 			| more_info 				|
  | Aladdin		    | G		| 1992-11-25 00:00:00 UTC	| More about Aladdin			|
  | The Terminator	    | R		| 1984-10-26 00:00:00 UTC	| More about The Terminator		|
  | When Harry Met Sally    | R		| 1989-07-21 00:00:00 UTC	| More about When Harry Met Sally	|
  | The Help	            | PG-13	| 2011-08-10 00:00:00 UTC	| More about The Help			|
  | Chocolat	            | PG-13	| 2001-01-05 00:00:00 UTC	| More about Chocolat			|
  | Amelie	            | R		| 2001-04-25 00:00:00 UTC	| More about Amelie			|
  | 2001: A Space Odyssey   | G		| 1968-04-06 00:00:00 UTC	| More about 2001: A Space Odyssey	|
  | The Incredibles	    | PG	| 2004-11-05 00:00:00 UTC	| More about The Incredibles		|
  | Raiders of the Lost Ark | PG	| 1981-06-12 00:00:00 UTC	| More about Raiders of the Lost Ark	|
  | Chicken Run		    | G		| 2000-06-21 00:00:00 UTC	| More about Chicken Run		|
  | Aladdin	            | G		| 1992-11-25 00:00:00 UTC	| More about Aladdin			|
  | The Terminator	    | R		| 1984-10-26 00:00:00 UTC	| More about The Terminator		|
  | When Harry Met Sally    | R		| 1989-07-21 00:00:00 UTC	| More about When Harry Met Sally	|
  | The Help	            | PG-13	| 2011-08-10 00:00:00 UTC	| More about The Help			|
  | Chocolat	            | PG-13	| 2001-01-05 00:00:00 UTC	| More about Chocolat			|
  | Amelie	            | R		| 2001-04-25 00:00:00 UTC	| More about Amelie			|
  | 2001: A Space Odyssey   | G		| 1968-04-06 00:00:00 UTC	| More about 2001: A Space Odyssey	|
  | The Incredibles	    | PG	| 2004-11-05 00:00:00 UTC	| More about The Incredibles		|
  | Raiders of the Lost Ark | PG	| 1981-06-12 00:00:00 UTC	| More about Raiders of the Lost Ark	|
  | Chicken Run		    | G		| 2000-06-21 00:00:00 UTC	| More about Chicken Run		|		

  And  I am on the RottenPotatoes home page
  
Scenario: restrict to movies with 'PG' or 'R' ratings
  Given I am on the RottenPotatoes home page
  When I check the ratings "PG,R"
  And I uncheck all ratings except "PG,R"
  When I click Refresh button
  And I should see movies table
  | Movie Title			| Rating	| Release Date			| More Info			     |	 
  | The Terminator		| R		| 1984-10-26 00:00:00 UTC	| More about The Terminator          |
  | When Harry Met Sally	| R		| 1989-07-21 00:00:00 UTC	| More about When Harry Met Sally    |
  | Amelie			| R		| 2001-04-25 00:00:00 UTC	| More about Amelie                  |
  | The Incredibles		| PG		| 2004-11-05 00:00:00 UTC	| More about The Incredibles         |
  | Raiders of the Lost Ark	| PG		| 1981-06-12 00:00:00 UTC	| More about Raiders of the Lost Ark |
  | The Terminator		| R		| 1984-10-26 00:00:00 UTC	| More about The Terminator          |
  | When Harry Met Sally	| R		| 1989-07-21 00:00:00 UTC	| More about When Harry Met Sally    |
  | Amelie			| R		| 2001-04-25 00:00:00 UTC	| More about Amelie		     |	
  | The Incredibles		| PG		| 2004-11-05 00:00:00 UTC	| More about The Incredibles	     |	
  | Raiders of the Lost Ark	| PG		| 1981-06-12 00:00:00 UTC	| More about Raiders of the Lost Ark |
  Then I do not see movies except ratings "PG,R"
  
  # enter step(s) to check the 'PG' and 'R' checkboxes
  # enter step(s) to uncheck all other checkboxes
  # enter step to "submit" the search form on the homepage
  # enter step(s) to ensure that PG and R movies are visible
  # enter step(s) to ensure that other movies are not visible

Scenario: no ratings selected
  Given I am on the RottenPotatoes home page
  When I uncheck all ratings except ""
  Then I do not see movies except ratings ""

Scenario: all ratings selected
  Given I am on the RottenPotatoes home page
  When I check the ratings "PG,R,PG-13,G"
  Then I see "5,6,4,10" of "PG,R,PG-13,G" rated movies 
