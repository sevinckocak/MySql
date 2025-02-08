select *  from denormalized;

LOAD DATA 
infile "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\denormalized.csv"
into table denormalized
columns terminated by ';' ;


show variables like "secure_file_priv";

insert into movies
select distinct movie_id, title, ranking, rating, year,votes, duration , oscars, budget
from denormalized
order by movie_id;

select* from movies;


insert into stars 
select distinct star_id, star_country_id, star_name 
from denormalized
order by star_id;