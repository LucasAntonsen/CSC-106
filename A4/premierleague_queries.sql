-- premierleague_queries.sql
-- CSC 106 - Jan 2019
-- File for Assignment 4, Task 3 queries.
-- Assignment created by prof. Celina Berg
-- Completed by Lucas Antonsen



.read premierleague_data.sql

.mode column
.header on

-------------------------------------------
-- Put your answers for Task 3 below --
-------------------------------------------

-- Write a query to print the team name, city, stadium name and capacity of all stadiums in the league in order of decreasing capacity.
-- Question 1 --
.print ''
.print 'Question 1'
.width 20 20 20 10 
select * from stadiums order by capacity desc;


-- Write a query to print the names of the players that are goal keepers that play at a home stadium with a capacity between 30000 and 50000.  You should print this in alphabetical order of the name of the stadium they play at.
-- Question 2 --
.print ''
.print 'Question 2'
.width 20 20
select player_name, stadium_name from stadiums natural join players where position = 'GK' and capacity between 30000 and 50000 order by stadium_name, player_name;



.print ''
-- Write a query to print the names of the referee, the number of games they have refereed and the number of red cards and yellow cards they award to the home team.  The output should be in order of the number of red cards then by yellow cards
-- Question 3 --
.print ''
.print 'Question 3'
.width 15 15 12 12
select referee, count(referee) as games_refereed, sum(team_redcards) as red_cards, sum(team_yellowcards) as yellow_cards from games group by referee order by red_cards, yellow_cards;





-- Write a query to print the nationality and the number of players of that nationality.  Print those nationalities with either 1 player or more than 10 players in the league.  The data should be sorted by increasing number of players of a given nationality.
-- Question 4 --
.print ''
.print 'Question 4'
.width 20 14
select nationality, count(nationality) as num_players from players group by nationality having count(nationality) = 1 or count(nationality) > 10 order by num_players;





-- Write a query to print the number of wins that each home team had. Print the result in decreasing order of wins..
-- Question 5 --
.print ''
.print 'Question 5'
.width 20 14
select team_name, sum(winner = 'H') as num_wins from games group by team_name order by num_wins desc, team_name;





-- Write a query to print the names of players on most winning team ordered by nationality then by player name.
-- Question 6 - optional --
.print ''
.print 'Question 6 - optional'
.width 20 20 20
select player_name, team_name, nationality from players natural join ((select team_name, sum(num_wins + away_wins) as wins from (select team_name, sum(winner = 'H') as num_wins from games group by team_name order by num_wins desc) natural join
(select (awayteam) as team_name, sum(winner = 'A') as away_wins from games group by awayteam order by away_wins desc) group by team_name order by wins desc limit 1)) order by nationality, player_name;


--select (awayteam) as team_name, sum(winner = 'A') as away_wins from games group by awayteam order by away_wins desc;

--select team_name, sum(num_wins + away_wins) as wins from (select team_name, sum(winner = 'H') as num_wins from games group by team_name order by num_wins desc) natural join
--(select (awayteam) as team_name, sum(winner = 'A') as away_wins from games group by awayteam order by away_wins desc) group by team_name order by wins desc limit 1;
