CREATE TABLE IF NOT EXISTS genre (
	id SERIAL PRIMARY KEY,
	title VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS artist (
	id SERIAL PRIMARY KEY,
	nikname varchar(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS album (
	id SERIAL PRIMARY KEY,
	title varchar(50) NOT NULL,
	year_ INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS song (
	id SERIAL PRIMARY KEY,
	name_song varchar(150) NOT NULL,
	duration INTEGER NOT NULL,
	fk_song_album INTEGER NOT NULL REFERENCES album(id)
);

CREATE TABLE IF NOT EXISTS collection (
	id SERIAL PRIMARY KEY,
	name_collection varchar(150) NOT NULL,
	year_collection INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS genre_artist (
	genre_id INTEGER REFERENCES genre(id),
	artist_id INTEGER REFERENCES artist(id),
	CONSTRAINT ga PRIMARY KEY (genre_id, artist_id)
);

CREATE TABLE IF NOT EXISTS artist_album (
	album_id INTEGER REFERENCES album(id),
	artist_id INTEGER REFERENCES artist(id),
	CONSTRAINT aa PRIMARY KEY (album_id, artist_id)
);

CREATE TABLE IF NOT EXISTS collection_song (
	collection_id INTEGER REFERENCES collection(id),
	song_id INTEGER REFERENCES song(id),
	CONSTRAINT cs PRIMARY KEY (collection_id, song_id)
);