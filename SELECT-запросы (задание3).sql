--Количество исполнителей в каждом жанре.
SELECT g.title, count(a.nikname)FROM genre AS g
JOIN genre_artist AS ga ON g.id = ga.genre_id
JOIN artist AS a ON ga.artist_id = a.id
GROUP BY g.title;

--Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT COUNT(s.id) FROM song as s  
JOIN album as a ON s.fk_song_album = a.id  
WHERE a.year_ BETWEEN 2018 and 2021; 

--Средняя продолжительность треков по каждому альбому.
SELECT a.title, AVG(s.duration) FROM album as a
JOIN song as s on s.fk_song_album = a.id
GROUP BY a.title
ORDER BY AVG(s.duration);

--Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT DISTINCT a.nikname FROM artist AS a
WHERE a.nikname NOT IN (
    SELECT DISTINCT a.nikname 
    FROM artist AS a
    LEFT JOIN artist_album AS aa ON a.id = aa.artist_id 
    LEFT JOIN album AS al ON al.id = aa.album_id
    WHERE al.year_ = 2020
);

--Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT c.name_collection FROM collection AS c
JOIN collection_song AS cs ON c.id = cs.collection_id
JOIN song AS s ON s.id = cs.song_id 
JOIN album AS al ON al.id = s.fk_song_album 
JOIN artist_album AS aa ON aa.album_id = al.id
JOIN artist AS a ON a.id = aa.artist_id 
WHERE a.nikname LIKE '%%MUROVEI%%'

--Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT DISTINCT a.title FROM album as a 
JOIN artist_album as aa ON a.id = aa.album_id 
JOIN artist as a2 on a2.id = aa.artist_id  
JOIN genre_artist as ga on a2.id = ga.artist_id 
GROUP BY a.title, ga.artist_id  
HAVING COUNT(ga.artist_id) > 1; 

--Наименования треков, которые не входят в сборники.
SELECT s.name_song FROM song AS s
LEFT JOIN collection_song AS cs ON s.id = cs.song_id 
WHERE cs.song_id IS NULL;

--Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
SELECT a2.nikname, s.duration 
FROM song AS s
JOIN album AS a ON a.id = s.fk_song_album 
JOIN artist_album AS aa ON aa.album_id = a.id
JOIN artist AS a2 ON a2.id = aa.artist_id 
GROUP BY a2.nikname, s.duration 
HAVING s.duration = (SELECT min(duration) FROM song)
ORDER BY a2.nikname; 

--Названия альбомов, содержащих наименьшее количество треков.

SELECT DISTINCT a.title FROM album AS a
JOIN song AS s ON s.fk_song_album = a.id
GROUP BY a.id
    HAVING count(a.id) = (
        SELECT count(id)
        FROM song 
        GROUP BY fk_song_album
        ORDER BY count
        LIMIT 1
    );