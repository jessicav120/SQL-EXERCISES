-- Craigslist Schema Design --

CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username TEXT NOT NULL,
    password VARCHAR(8) NOT NULL,
    first_name TEXT,
    last_name TEXT,
    preferred_region INTEGER REFERENCES regions
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    text TEXT,
    user_id INTEGER REFERENCES users,
    region_id INTEGER REFERENCES regions,
    category INTEGER REFERENCES categories
);