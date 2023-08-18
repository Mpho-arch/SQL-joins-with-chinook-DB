select * from genres;

select * from playlists;

select * from playlists where Name LIKE '%s'

select * from artists where Name = "U2"

select * from artists where Name = 150"

-- find all the albums for a given artists 
select Name, AlbumId, Title from artists
join albums on artists.ArtistId = albums.ArtistId
where artists.ArtistId = 17;

-- where Name = "Any Winehouse";

-- Find all the songs for a given Genre  

SELECT * FROM Genres
JOIN tracks on Genres.GenreId = tracks.GenreId
WHERE Genres.GenreId =  5;
-- WHERE Genres.Name = "Blues"; --

-- Find all the songs in a playlist - by playlist Name

select * from playlists
join playlist_track
  on playlist_track.PlaylistId = playlists.PlaylistId
join tracks
  on playlist_track.TrackId = tracks.TrackId
Where playlists.Name = "Classical"

-- Find all the artrist for a given Genre

select 
     DISTINCT artists.Name
    from Genres
 Join tracks on tracks.GenreId = genres.GenreId
 join albums on albums.AlbumId = tracks.AlbumId
 join artists on artists.ArtistId = Albums.ArtistId
where Genres.Name = "Jazz";

-- find all the artist for the given genre artists
SELECT * FROM artists
JOIN albums on artist.ArtistId = albums.ArtistId

JOIN tracks on albums.AlbumId = tracks.AlbumId
JOIN genres on tracks.GenreId = genres.GenreId
WHERE artists.Name = "Accept"

-- find the playlist with the most/ least songs (will need a group by and count)

select playlists.Name, count(*) as SongCount from playlists
     join playlist_track
     on playlists.PlaylistId = playlist_track.PlaylistId
group by playlists.Name
order by SongCount DESC
limit 1 ;


select playlists.Name, count(*) as SongCount from playlists

   join playlist_track
   on playlists.PlaylistId = playlist_track.PlaylistId
group by playlists.Name
order by count(*) ASC
limit 1 ;

-- Find the total for a given invoice (will need a sum)

select total from invoices where invoices.InvoiceId = 17 ;

-- Fina all the playlists containing a given genres
SELECT genres.name, playlists.Name FROM playlists
JOIN playlist_track on playlist_track.PlaylistId = playlists.PlaylistId
JOIN tracks on tracks.TrackId = playlist_track.TrackId
JOIN genres on genres.GenreId = tracks.GenreId
WHERE genres.Name = 'Pop'

-- Find the biggest/smallest invoice amounts (needs group by)

select invoiceId, Min(Total) from invoices;
select InvoiceId, Max(Total) from invoices;

--Find the artisst with the most /least songs (needs group by)

select 
  -- count(DISTINCT artists.Name)
  -- artists.Name
    artists.Name, count(*) as TrackCount
from artists
join albums on albums.ArtistId = artists.ArtistId
Join tracks on tracks.AlbumId = albums.AlbumId
group by artists.Name
order by TrackCount DESC
--  order by TrackCount ASC

limit 6 offset 5;

--where Genre.Name = "Rock"
