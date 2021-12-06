#This file is creating database "join_us_db", using it and then creating "users" table.


CREATE DATABASE join_us_db;
USE join_us_db;



CREATE TABLE users(
    email VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);