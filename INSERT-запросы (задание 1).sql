---------- наполняем артистами---------------------------------------------
INSERT INTO artist (nikname) VALUES 
    ('MUROVEI'),
    ('красное дерево'),
    ('Ночные снайперы'),
    ('БИ-2'),
    ('DAASHA'),
    ('Тима Белорусских'),
    ('Rob Mazurek'),
    ('Miko Marks'),
    ('Leven Kali');

---------- наполняем жанрами---------------------------------------------
INSERT INTO genre (title) VALUES 
    ('RAP'),
    ('ROCK'),
    ('POP'),
    ('JAZZ'),
    ('Bluse'),
    ('Relax');

---------- наполняем альбомы---------------------------------------------
INSERT INTO album (title, year_) VALUES 
    ('winsk', 2023),
    ('подгон 2', 2022),
    ('цунами', 2002),
    ('№16плюс', 2016),
    ('вьюга', 2023),
    ('Моя кассета - твой первый диск', 2018),
    ('Good Days', 2022),
    ('Trouble', 2022),
    ('Leven Kali: Low Tide', 2019);

---------- наполняем песни---------------------------------------------
INSERT INTO song (name_song, duration, fk_song_album) VALUES 
    ('свобода', 226, 1),
    ('индийское кино', 243, 1),
    ('Дельтаплан', 164, 2),
    ('Летим домой',226, 2),
    ('ты дарила мне розы', 186, 3),
    ('цунами', 192, 3),
    ('хипстер', 250, 4),
    ('Тёмные небеса', 300, 4),
    ('вьюга', 147, 5),
    ('незабудка', 236, 6),
    ('Good Days', 174, 7),
    ('Strange Wing', 480, 7),
    ('Lomé', 320, 7),
    ('One more_ Night', 227, 8),
    ('The Good Life', 240, 8),
    ('Nunwrong', 305, 9);

---------- наполняем сборники---------------------------------------------
INSERT INTO collection (name_collection, year_collection) VALUES 
    ('best', 2023),
    ('best', 2022),
    ('best', 2021);
    
---------- наполняем связи жанр - артист---------------------------------------

INSERT INTO genre_artist (genre_id, artist_id) VALUES 
    (3,1),
    (3,2),
    (1,9),
    (4,3),
    (4,4),
    (5,5),
    (5,6),
    (6,7),
    (6,8);

---------- наполняем связи артист альбом---------------------------------------
INSERT INTO artist_album (artist_id, album_id) VALUES 
    (1,1),
    (2,2),
    (3,3),
    (4,4),
    (5,5),
    (6,6),
    (7,7),
    (8,8),
    (9,9);

---------- наполняем связи песня коллекция--------------------------------------
INSERT INTO collection_song  (collection_id, song_id) VALUES 
    (1,1),
    (1,2),
    (1,3),
    (2,4),
    (2,5),
    (2,6),
    (3,7),
    (3,8);


