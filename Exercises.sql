-- Find the earliest date a user joined
SELECT 
    DATE_FORMAT(MIN(created_at), "%M %D %Y") AS earliest_date
FROM users;

SELECT email, created_at FROM users ORDER BY created_at ASC LIMIT 1; /* no specific date format*/


-- Find the last date a user joined
SELECT 
    DATE_FORMAT(MAX(created_at), "%M %D %Y") AS earliest_date
FROM users; 

SELECT email, created_at FROM users ORDER BY created_at DESC LIMIT 1; /* no specific date format*/


-- Select the email from the first user that joined
SELECT * FROM users WHERE created_at = (SELECT MIN(created_at) FROM users);


-- Select number of users according to the month they joined
SELECT 
    MONTHNAME(created_at) as month,
    COUNT(*) as count
FROM users GROUP BY month
ORDER BY count DESC;


-- Select number of yahoo users
SELECT COUNT(*) AS yahoo_users FROM users 
    WHERE email LIKE '%@yahoo.com%';


-- Select number of hotmail users
SELECT COUNT(*) AS hotmail_users FROM users 
    WHERE email LIKE '%@hotmail.com%';


-- Select number of gmail users
SELECT COUNT(*) AS gmail_users FROM users 
    WHERE email LIKE '%@gmail.com%';


-- Select number of users for each email host
SELECT  
    CASE
        WHEN email LIKE '%@yahoo.com%' THEN 'yahoo'
        WHEN email LIKE '%@gmail.com%' THEN 'gmail'
        WHEN email LIKE '%@hotmail.com%' THEN 'hotmail'
        ELSE 'other'
    END AS provider,
    COUNT(*) AS total_users
FROM users
GROUP BY provider
ORDER BY total_users DESC;



