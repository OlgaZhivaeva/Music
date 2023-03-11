CREATE TABLE IF NOT EXISTS Genre(
    id SERIAL PRIMARY KEY,
    name VARCHAR(40) UNIQUE NOT NULL
);
CREATE TABLE IF NOT EXISTS Singer(
    id SERIAL PRIMARY KEY,
    nikname VARCHAR(40) UNIQUE NOT NULL
);
CREATE TABLE IF NOT EXISTS GenreSinger(
    genre_id INTEGER REFERENCES Genre(id),
    singer_id INTEGER REFERENCES Singer(id),
    CONSTRAINT pk PRIMARY KEY (genre_id, singer_id)
);
CREATE TABLE IF NOT EXISTS Album(
    id SERIAL PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    release_year INTEGER NOT NULL
);
CREATE TABLE IF NOT EXISTS AlbumSinger(
    album_id INTEGER REFERENCES Album(id),
    singer_id INTEGER REFERENCES Singer(id),
    CONSTRAINT pr PRIMARY KEY (album_id, singer_id)
);
CREATE TABLE IF NOT EXISTS Track(
    id SERIAL PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    duration TIME NOT NULL,
    album_id INTEGER REFERENCES Album(id)
);
CREATE TABLE IF NOT EXISTS Collection(
    id SERIAL PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    release_year INTEGER NOT NULL
);
CREATE TABLE IF NOT EXISTS CollectionTrack(
    collection_id INTEGER REFERENCES Collection(id),
    track_id INTEGER REFERENCES Track(id),
    CONSTRAINT prk PRIMARY KEY (collection_id, track_id)
);