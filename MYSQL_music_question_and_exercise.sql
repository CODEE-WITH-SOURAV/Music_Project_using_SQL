use music;

-- 1. list of all record_label Names and IDs
select * 
from record_label
order by ID asc;

-- 2. list of all artist Names and IDs
select * 
from artist
order by ID asc;

-- 3. list of all Artist Names only Female
select Name
from artist
where Gender = "Female"
group by Name;

-- 4. list of all Album Names, IDs and Year
select * 
from album;

-- 5. list of all song Names and Ids
select *
from song
order by ID asc;

-- 6. List all artists for each record label sorted by artist name. 
select
	ar.name "Artist Name",
	r.name "Record Label Name"  
from record_label r
join artist ar
on r.ID = ar.record_label_id
order by ar.name asc;	

-- 7. List the number of songs per artist in descending order
select
    ar.name "Artist Name",
    count(*) "Number of Songs"
from song s
join album al
on s.Album_ID = al.ID
join artist ar 
on al.Artist_ID = ar.ID
group by ar.name
order by count(*) desc;    

-- 8. Which artist or artists have recorded the most number of songs?
select
   ar.name "Artist Name",
   count(*) "Number of Songs"
from song s 
join album al 
on s.Album_ID = al.ID
join artist ar 
on al.Artist_ID = ar.ID 
group by ar.name
order by count(*) desc
limit 1;

-- 9. Which artist or artists have recorded the least number of songs?
select
   ar.name "Artist Name",
   count(*) "Number of Songs"
from song s  
join album al 
on s.Album_ID = al.ID
join artist ar 
on al.Artist_ID = ar.ID 
group by ar.name
order by count(*) asc
limit 1;

-- 10. which artists have recorded songs longer than 5 minutes, and how many songs was that?
select  
	temp.artist "Artist Name",
	count(*) "Number of Songs greater than 5 minutes"
from (
		select
           ar.name artist,
           s.duration "Duration"
	    from song s 
        join album al 
        on s.Album_ID = al.ID 
		join artist ar 
        on al.Artist_ID = ar.ID
        where duration > 5
	 ) as temp
group by temp.artist;

-- 11. for each artist and album how many songs were less than 5 minutes long?
select
   ar.name "Artist Name",
   al.name "Album Name",
   -- s.name "Song",
   -- s.duration "Duration",
   count(*) "Number of Songs less than 5 minutes"
from song s 
join album al 
on s.Album_ID = al.ID
join artist ar 
on al.Artist_ID = ar.ID
where duration < 5
group by ar.name,
         al.name;
	
 -- 12. list the artist, song and year of the top 5 longest recorded songs
select
	ar.name "Artist Name",
	al.name "Album Name",
	s.name "Song",
	al.year  "Year Recorded",
	s.duration "Duration"
from song s 
join album al 
on s.Album_ID = al.ID
join artist ar 
on al.Artist_ID = ar.ID
order by s.duration desc
limit 5;

-- 13. Number of albums recorded for each year
select
	al.year  "Year",
	count(*) "Number of Albums Recorded"
from album al
group by al.year;

-- 14. What is the max number of recorded albums across all the years?
-- Hint:  using the above sql as a temp table
select
	max(count) "Max Number of Albums Recorded per year for all Years"
from (
		select
			al.year  "Year",
			count(*) count
		from album al
		group by al.year
      ) as temp;

-- 15. total duration of all songs recorded by each artist in descending order
select
	ar.name "Artist Name",
 	sum(s.duration) "Total Duration of All Songs"
from song s 
join album al 
on s.Album_ID = al.ID
join artist ar 
on al.Artist_ID = ar.ID
group by ar.name
order by sum(s.duration) desc;
 
-- 16. for which artist and album are there no songs less than 5 minutes long?
select
   ar.name "Artist Name",
   al.name "Album Name", 
   --s.name "Song",
   --s.duration "duration"
from artist ar 
left join album al 
on ar.ID = al.Artist_ID
left join song s 
on s.Album_ID = al.ID and s.duration < 5
where s.name is null;

-- 17. Display a table of all artists, albums, songs and song duration 
--     all ordered in ascending order by artist, album and song  
select 
   ar.name as "Artist Name",
   al.name as "Album Name",
   s.name as "Song",
   s.duration as "Duration"
from artist ar 
join album al 
on al.Artist_ID = ar.ID 
join song s 
on s.Album_ID = al.ID
order by ar.name asc,
         al.name asc,
         s.name asc;

-- 18. List the top 3 artists with the longest average song duration, in descending with longest average first.
select
	ar.name "Artist Name",
	avg(s.duration) "Average Song Duration (min)"
from song s 
join album al 
on s.Album_ID = al.ID 
join artist ar 
on al.Artist_ID = ar.ID
group by ar.name
order by avg(s.duration) desc
limit 3;

-- 19. Which artists did not release an album during the decades of the 2004 and the 2023?
select distinct
	ar.name "Artist Name"
from artist ar 
left join album al 
on ar.ID = al.Artist_ID 
and year >= 1980 and year <= 2023 
where year is null
order by ar.name;	
	 
-- 20. Which artists did release an album during the decades of the 2004 and the 2023? 
select distinct
	ar.name "Artist Name"
from artist ar 
left join album al 
on ar.ID = al.Artist_ID 
and year >= 2004 and year <= 2023 
where year is not null
order by ar.name; 

 
