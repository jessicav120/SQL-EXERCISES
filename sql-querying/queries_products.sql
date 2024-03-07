-- Comments in SQL Start with dash-dash --

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
SELECT * FROM products WHERE can_be_returned = true;

-- 9. Display only the products that have a price less than 44.00.
SELECT * FROM products WHERE price < 44.00;

-- 10. Display only the products that have a price in between 22.50 and 99.99.
SELECT * FROM products WHERE price BETWEEN 22.50 AND 99.99;
    -- OR 
SELECT * FROM products WHERE price >= 22.50 AND price <= 99.99;

-- 11. There’s a sale going on: Everything is $20 off! Update the database accordingly.
UPDATE products SET price = price - 20.00 WHERE price > 20.00;

-- 12. Because of the sale, everything that costs less than $25 has sold out. Remove all products whose price meets this criteria.
DELETE FROM products WHERE price < 25.00; 

-- 13. And now the sale is over. For the remaining products, increase their price by $20.
UPDATE products SET price = price + 20.00;

-- 14. There is a new company policy: everything is returnable. Update the database accordingly.
UPDATE products SET can_be_returned = true WHERE can_be_returned = false;