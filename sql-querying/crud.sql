-- Query 1,2,3. 
INSERT INTO products (name, price, can_be_returned) VALUES
    ('chair', 44.00, false),
    ('stool', 25.99, true),
    ('table', 124.00, false);

-- 4. Display all of the rows and columns in the table.
SELECT * FROM products;

-- 5. Display all of the names of the products.
SELECT name FROM products;

-- 6. Display all of the names and prices of the products.
SELECT name, price FROM products;

-- 7. Add a new product - make up whatever you would like!
INSERT INTO products (name, price, can_be_returned) VALUES
    ('lamp', 45.99, false);

-- 8. Display only the products that ***can_be_returned***
SELECT name, can_be_returned FROM products WHERE can_be_returned = true;

-- 9. Display only the products that have a price less than 44.00.
SELECT name, price FROM products WHERE price < 44.00;

-- 10. Display only the products that have a price in between 22.50 and 99.99.
SELECT name, price FROM products WHERE price BETWEEN 22.50 AND 99.99;
    -- OR 
SELECT name, price FROM products WHERE price >= 22.50 AND price <= 99.99;

-- 11. There’s a sale going on: Everything is $20 off! Update the database accordingly.
UPDATE products SET price = price - 20.00 WHERE price > 20.00;

-- 12. Because of the sale, everything that costs less than $25 has sold out. Remove all products whose price meets this criteria.
DELETE FROM products WHERE price < 25.00; 

-- 13. And now the sale is over. For the remaining products, increase their price by $20.
UPDATE products SET price = price + 20.00;

-- 14. There is a new company policy: everything is returnable. Update the database accordingly.
UPDATE products SET can_be_returned = true WHERE can_be_returned = false;

-- Table "public.analytics"
--      Column      |  Type   | Collation | Nullable |                Default                
-- -----------------+---------+-----------+----------+---------------------------------------
--  id              | integer |           | not null | nextval('analytics_id_seq'::regclass)
--  app_name        | text    |           | not null | 
--  category        | text    |           | not null | 
--  rating          | real    |           |          | 
--  reviews         | integer |           |          | 
--  size            | text    |           |          | 
--  min_installs    | integer |           |          | 
--  price           | real    |           |          | 
--  content_rating  | text    |           |          | 
--  genres          | text[]  |           |          | 
--  last_updated    | date    |           |          | 
--  current_version | text    |           |          | 
--  android_version | text    |           |          | 

-- 1. Find the app with an ID of ***1880***
SELECT * FROM analytics WHERE id = 1880;

-- 2. Find the ID and app name for all apps that were last updated on August 01, 2018.
SELECT app_name, id FROM analytics WHERE last_updated = '2018-08-01';

-- 3. Count the number of apps in each category, e.g. “Family | 1972”.
SELECT category, COUNT(*) FROM analytics GROUP BY category;

-- 4. Find the top 5 most-reviewed apps and the number of reviews for each.
SELECT app_name, reviews FROM analytics ORDER BY reviews DESC LIMIT 5;

-- 5. Find the app that has the most reviews with a rating greater than equal to 4.8.
SELECT app_name, reviews, rating FROM analytics WHERE rating >= 4.8 ORDER BY rating DESC LIMIT 1;

-- 6. Find the average rating for each category ordered by the highest rated to lowest rated.
SELECT category, AVG(rating) AS avg_rating FROM analytics GROUP BY category ORDER BY avg_rating DESC;

-- 7. Find the name, price, and rating of the most expensive app with a rating that’s less than 3.
SELECT app_name, MAX(price), rating 
FROM analytics
GROUP BY app_name
HAVING rating < 3; -- ASK WHY THIS DOESN"T WORK

SELECT app_name, price, rating FROM analytics WHERE rating < 3 ORDER BY price DESC LIMIT 1;

-- 8. Find all apps with a min install not exceeding 50, that have a rating. Order your results by highest rated first.

SELECT app_name, min_installs, rating FROM analytics 
    WHERE min_installs <= 50 AND rating > 0
    ORDER BY rating DESC;

-- 9. Find the names of all apps that are rated less than 3 with at least 10000 reviews.
SELECT app_name FROM analytics WHERE rating < 3 AND reviews >= 10000;

-- 10. Find the top 10 most-reviewed apps that cost between 10 cents and a dollar.
SELECT app_name, reviews, price 
    FROM analytics 
    WHERE price BETWEEN 0.10 AND 1.00
    ORDER BY reviews DESC 
    LIMIT 10;

-- 11. Find the most out of date app. Hint: You don’t need to do it this way, but it’s possible to do with a subquery: http://www.postgresqltutorial.com/postgresql-max-function/

SELECT app_name, last_updated 
    FROM analytics 
    WHERE last_updated = (
        SELECT MIN(last_updated) 
        FROM analytics
        );

-- 12. Find the most expensive app (the query is very similar to #11).
SELECT app_name, price FROM analytics WHERE price = (SELECT MAX(price) FROM analytics);

-- 13. Count all the reviews in the Google Play Store.
SELECT SUM(reviews) AS total_reviews FROM analytics;

-- 14. Find all the categories that have more than 300 apps in them.
SELECT category, COUNT(*) 
    FROM analytics 
    GROUP BY category 
    HAVING COUNT(*) > 300 
    ORDER BY COUNT(*) DESC;

-- 15. Find the app that has the highest proportion of min_installs to reviews, among apps that have been installed at least 100,000 times. Display the name of the app along with the number of reviews, the min_installs, and the proportion.

SELECT app_name, reviews, min_installs, min_installs/reviews AS proportion 
FROM analytics
WHERE min_installs >= 100000
ORDER BY proportion DESC
LIMIT 1;