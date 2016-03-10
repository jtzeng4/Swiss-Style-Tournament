-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.
DROP DATABASE IF EXISTS tournament;

CREATE DATABASE tournament;
\c tournament

CREATE TABLE players(id serial PRIMARY KEY, name text);
CREATE TABLE matches(match_num serial PRIMARY KEY, 
	winner int REFERENCES players(id), loser int REFERENCES players(id));

CREATE VIEW wintracker 
AS
	SELECT players.id, players.name,
			COUNT(matches.winner) AS wins
	FROM players
		LEFT JOIN matches
				ON players.id = matches.winner
	ORDER BY wins;

CREATE VIEW losstracker
AS
	SELECT players.id, players.name,
			COUNT(matches.loser) AS losses
	FROM players
		LEFT JOIN matches
				ON players.id = matches.loser
	ORDER BY losses;

CREATE VIEW totalmatches
AS
	SELECT players.id, players.name,
			COUNT(matches.match_num) AS total
	FROM players
		LEFT JOIN matches
				ON players.id = matches.winner or players.id = matches.loser
	ORDER BY total;