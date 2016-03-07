-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.
DROP DATABASE IF EXISTS tournament;
DROP TABLE IF EXISTS players;
DROP TABLE IF EXISTS matches;

CREATE DATABASE tournament;

CREATE TABLE players(id serial PRIMARY KEY, name text, 
	wins int, losses int, matches int);
CREATE TABLE matches(match_num serial PRIMARY KEY, 
	winner text, loser text);

