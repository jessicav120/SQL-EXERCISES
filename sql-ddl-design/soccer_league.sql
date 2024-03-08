--- Soccer League DB Schema --

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    city TEXT NOT NULL,
    ranking INTEGER
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    team_id INTEGER REFERENCES teams NOT NULL
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE seasons (
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    home_team INTEGER REFERENCES teams NOT NULL,
    away_team INTEGER REFERENCES teams NOT NULL,
    season_id INTEGER REFERENCES seasons NOT NULL,
    location TEXT,
    date DATE,
    referee_id INTEGER REFERENCES referees
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players NOT NULL,
    match_id INTEGER REFERENCES matches NOT NULL
);