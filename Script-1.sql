create table if not exists genre (
    genre_id SERIAL primary key, 
    title varchar(40) not null
);
create table if not exists artist (
    artist_id SERIAL primary key,
    name varchar(40) not null
); 
create table if not exists ListArtists (
    genre_id integer references genre(genre_id), 
    artist_id integer references artist(artist_id),
    constraint pk_ListArtists primary key (genre_id, artist_id) 
);
create table if not exists album (
    album_id SERIAL primary key,
    title varchar(40) not null,
    year date null constraint chk_album_year check (EXTRACT(YEAR FROM year) > 1000 and year <= CURRENT_DATE)
    
);
create table if not exists ListAlbums (
    artist_id integer references artist(artist_id),
    album_id integer references album(album_id), 
    constraint pk_ListAlbums primary key (artist_id, album_id) 
);
create table if not exists song (
    song_id SERIAL primary key,
    title varchar(40) not null,
    duration integer not null constraint chk_song_duration check (duration > 0 and duration < 22000)
);
create table if not exists ListSongs (
    album_id integer references album(album_id), 
    song_id integer references song(song_id),
    constraint pk_ListSongs primary key (album_id, song_id) 
);
create table if not exists collection (
    collection_id SERIAL primary key,
    title varchar(40) not null,
    year date null constraint chk_collection_year check (EXTRACT(YEAR FROM year) > 1900 and year <= CURRENT_DATE)  
);
create table if not exists CollectionsSongs (
    collection_id integer references collection(collection_id), 
    song_id integer references song(song_id),
    constraint pk_CollectionsSongs primary key (collection_id, song_id) 
);