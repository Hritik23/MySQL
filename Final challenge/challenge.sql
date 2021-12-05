-- challenge 1
-- We want to reward our users who have been around the longest.  
-- Find the 5 oldest users.

SELECT username, created_at FROM users
ORDER BY created_at
LIMIT 5;





-- challenge 2
-- What day of the week do most users register on?
-- We need to figure out when to schedule an ad campgain.

SELECT COUNT(created_at) AS "Count", DAYNAME(created_at) AS "Day" FROM users
GROUP BY DAYNAME(created_at)
ORDER BY COUNT(created_at) DESC
LIMIT 1;





-- challenge 3
-- We want to target our inactive users with an email campaign.
-- Find the users who have never posted a photo

SELECT users.id, users.username FROM users LEFT JOIN photos
ON users.id=photos.user_id
WHERE photos.id IS NULL
ORDER BY users.id;





-- challenge 4
-- We're running a new contest to see who get the most likes on a single photo.
-- WHO WON??!!

SELECT username , COUNT(*) AS "Count" FROM (users INNER JOIN photos
ON users.id=photos.user_id)
INNER JOIN likes 
ON likes.photo_id=photos.id
GROUP BY likes.photo_id
ORDER BY COUNT(*) DESC
LIMIT 1;





-- challenge 5
-- Our Investors want to know...
-- How many times does the average user post?

SELECT (SELECT COUNT(*) FROM photos)/(SELECT COUNT(*) FROM users) as "avg";





-- challenge 6
-- A brand wants to know which hashtags to use in a post
-- What are the top 5 most commonly used hashtags?

SELECT tags.tag_name , COUNT(tags.id) AS "Count" FROM tags INNER JOIN photo_tags 
ON tags.id=photo_tags.tag_id
GROUP BY photo_tags.tag_id
ORDER BY  COUNT(tags.id) DESC
LIMIT 5;





-- challenge 7
-- We have a small problem with bots on our site...
-- Find users who have liked every single photo on the site

SELECT username, COUNT(users.username) AS "username" FROM users LEFT JOIN likes 
ON users.id=likes.user_id
GROUP BY users.username
HAVING COUNT(users.username)=(SELECT COUNT(*) FROM photos) ;