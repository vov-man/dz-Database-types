--Название и год выхода альбомов, вышедших в 2018 году.

SELECT title, year_ FROM album 
WHERE year_ = 2018;

--Название и продолжительность самого длительного трека.-------------------

SELECT name_song, duration FROM song 
ORDER BY duration desc LIMIT 1;

--Название треков, продолжительность которых не менее 3,5 минут.-----------

SELECT name_song, duration FROM song 
WHERE duration between 210 and 800;

--Названия сборников, вышедших в период с 2018 по 2020 год включительно.---------------

SELECT name_collection, year_collection FROM collection 
WHERE year_collection  BETWEEN 2018 and 2020;

--Исполнители, чьё имя состоит из одного слова.-----------------------------------------

SELECT nikname FROM artist 
WHERE nikname not LIKE '% %';

--Название треков, которые содержат слово «мой» или «my».--------------------------------

SELECT name_song FROM song 
WHERE (name_song LIKE '%my%') 
or  (name_song LIKE '%мой%');  