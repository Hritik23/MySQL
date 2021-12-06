The challenge and Project here  is referenced to "The Ultimate MySQL Bootcamp: Go from SQL Beginner to Expert" course on Udemy.

In the project, I have created 500 fake data points with the "faker" package , inserted into my MySQL database after creating the connection between the nodejs and MySQL.
Then , I created the webpage using "express" package , interacting dynamically with MySQL using "ejs".Having address "https://join-us-project1992.run-ap-south1.goorm.io/" , when server is put on,
doing two things.
1. It is communicating with MySQL database , and when webpage is clicked , gives the total count of users already registered on our database.
2. When email is given , webpage is putting it along with current timestamp in MySQL database.