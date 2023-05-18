CREATE TABLE IF NOT EXISTS genre (
	id serial PRIMARY KEY, 
	musical_genres varchar(100) NOT NULL UNIQUE);

CREATE TABLE IF NOT EXISTS artist (
	id serial PRIMARY KEY, 
	artist_name varchar(100) NOT NULL UNIQUE, 
	artist_nickname varchar(100) UNIQUE);
	
CREATE TABLE IF NOT EXISTS genre_performers (
	genre_id integer REFERENCES genre(id), 
	artist_id integer REFERENCES artist(id), 
	CONSTRAINT genre_performers_pk PRIMARY KEY (genre_id, artist_id));	

CREATE TABLE IF NOT EXISTS album (
	id serial PRIMARY KEY, 
	album_name varchar(100) NOT NULL, 
	album_date integer NOT NULL);
	
CREATE TABLE IF NOT EXISTS joint_album (
	album_id integer REFERENCES album(id), 
	artist_id integer REFERENCES artist(id), 
	CONSTRAINT joint_album_pk PRIMARY KEY (album_id, artist_id));

CREATE TABLE IF NOT EXISTS track (
	id serial PRIMARY KEY, 
	track_name varchar(100) NOT NULL, 
	track_duration integer NOT NULL, 
	album_id integer REFERENCES album(id));

CREATE TABLE IF NOT EXISTS collection (
	id serial PRIMARY KEY, 
	collection_name varchar(100) NOT NULL, 
	collection_date integer NOT NULL);

CREATE TABLE IF NOT EXISTS collection_tracks (
	track_id integer REFERENCES track(id), 
	collection_id integer REFERENCES collection(id), 
	CONSTRAINT collection_tracks_pk PRIMARY KEY (track_id, collection_id));
