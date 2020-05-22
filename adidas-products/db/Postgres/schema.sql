CREATE SCHEMA IF NOT EXISTS adidas_product;

DROP DATABASE IF EXISTS adidas_product;

CREATE DATABASE adidas_product;

\c adidas_product;

CREATE TABLE shoe (
    id SERIAL PRIMARY KEY,
    collection_name varchar(100),
    name varchar(100),
    reviews INT,
    color INT,
    images INT,
    FOREIGN KEY (reviews) REFERENCES reviews,
    FOREIGN KEY (color) REFERENCES colors
    FOREIGN KEY (images) REFERENCES images
);

CREATE TABLE reviews (
    id SERIAL PRIMARY KEY,
    count INT,
    avg INT,
);

CREATE TABLE colors (
    id SERIAL PRIMARY KEY,
    url varchar(100),
    name INT,
    price INT,
    sizes INT,
    FOREIGN KEY (price) REFERENCES reviews,
    FOREIGN KEY (sizes) REFERENCES sizes
);

CREATE TABLE sizes (
    id SERIAL PRIMARY KEY,
    list_price INT,
    sale_price INT
);

CREATE TABLE images (
    id SERIAL PRIMARY KEY,
    image_1 varchar(100),
    image_2 varchar(100),
    image_3 varchar(100),
    image_4 varchar(100),
    image_5 varchar(100),
    image_6 varchar(100),
    image_7 varchar(100),
    image_8 varchar(100),
    image_9 varchar(100),
    image_10 varchar(100)
);

