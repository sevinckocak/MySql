use movie_db;
# 1. Show the films with a budget greater than $10 million and a ranking lower than 6.
SELECT m.title, m.budget, m.ranking
FROM movies m
WHERE m.budget > 10000000 AND m.ranking < 6;
# 2. Show the action films with a rating higher than 8.8, produced after 2009.
SELECT m.title, m.rating, m.year,g.genre_name
FROM movies m
JOIN genres g ON m.movie_id = g.movie_id
WHERE m.rating > 8.8 AND m.year < 2009 AND g.genre_name = "Action" ;

# 3. Show the drama films with a duration of more than 150 minutes and more than 2 Oscars.
SELECT m.title, m.duration, m.oscars ,g.genre_name
FROM movies m
JOIN genres g ON m.movie_id = g.movie_id
WHERE m.duration > 150 AND m.oscars > 2 AND g.genre_name = "Drama" ;

# 4. Show the films in which Orlando Bloom and Ian McKellen acted together and that have won more than 2 Oscars.
SELECT m.title , m.oscars
FROM movies m
JOIN movie_stars ms ON m.movie_id = ms.movie_id
JOIN stars s ON ms.star_id = s.star_id
JOIN movie_stars ms1 ON m.movie_id = ms1.movie_id
JOIN stars s1 ON ms1.star_id = s1.star_id
WHERE m.oscars > 2 AND s.star_name = "Orlando Bloom" AND s1.star_name = "Ian Mckellen" ;


# 5. Show the Quentin Tarantino films with more than 500,000 votes, produced before 2000.

# 6. Show the thriller films with a budget greater than $25 million.

# 7. Show the drama films in Italian, produced between 1990 and 2000.
SELECT m.title, g.genre_name, l.language_name, m.year
FROM movies m 
JOIN languages l ON m.movie_id = l.movie_id
JOIN genres g ON m.movie_id = g.movie_id
WHERE g.genre_name = "Drama" AND l.language_name = "Italian" AND m.year BETWEEN 1990 and 2000;

# 8. Show the films featuring Tom Hanks that have won more than 3 Oscars.


# 9. Show the history films produced in the USA with a duration between 100 and 200 minutes.

# 10. Compute the average budget of films directed by Peter Jackson.
SELECT AVG(m.budget) AS avg_budget
FROM movies m
JOIN movie_directors md ON m.movie_id = md.movie_id
JOIN directors d ON d.director_id = md.director_id
WHERE d.director_name = "Peter Jackson";


# 11. Show the Francis Ford Coppola film with the lowest budget.
SELECT m.title, m.budget
FROM movies m 
JOIN movie_directors md ON m.movie_id = md.movie_id
JOIN directors d ON d.director_id = md.director_id
WHERE d.director_name = "Francis Ford Coppola"
ORDER BY m.budget ASC
LIMIT 1; 

# 12. Show the film with the most votes that was produced in the USA.

# 13. Show films produced in more than one country
SELECT m.title, COUNT(pc.country_id) AS pc_count
FROM movies m JOIN producer_countries pc ON m.movie_id = pc.movie_id
GROUP BY pc.movie_id
HAVING pc_count > 1;

# 14. List all stars who have acted in more than 2 films

# 15. Show the films with a duration of more than 150 minutes and more than half of a million votes
SELECT m.title, m.duration, m.votes FROM movies m WHERE m.duration > 150 AND m.votes > 500000;

# 16. List all directors who have directed more than 2 films

