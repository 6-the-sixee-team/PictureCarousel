DROP DATABASE IF EXISTS adidas_product;

CREATE DATABASE adidas_product;

\c adidas_product;

CREATE TABLE shoe (
    id SERIAL PRIMARY KEY,
    name varchar(100),
    collection_name varchar(100),
    reviews INT UNIQUE,
    color INT UNIQUE,
    FOREIGN KEY (color) REFERENCES colors
);

CREATE TABLE colors (
    id SERIAL PRIMARY KEY,
    shoe_id INT,
    color_id INT,
    FOREIGN KEY (shoe_id) REFERENCES shoe,
    FOREIGN KEY (color_id) REFERENCES color
);

CREATE TABLE color (
    id SERIAL PRIMARY KEY,
    url varchar(100),
    name INT,
    price INT,
    sizes INT,
    image_1 varchar(100),
    image_2 varchar(100),
    image_3 varchar(100),
    image_4 varchar(100),
    image_5 varchar(100),
    image_6 varchar(100),
    image_7 varchar(100),
    image_8 varchar(100),
    image_9 varchar(100),
    image_10 varchar(100),
    FOREIGN KEY (sizes) REFERENCES sizes
);

CREATE TABLE sizes (
    id SERIAL PRIMARY KEY,
    color_id INT,
    size_id INT,
    FOREIGN KEY (color_id) REFERENCES color,
    FOREIGN KEY (size_id) REFERENCES size
);

CREATE TABLE size (
    id SERIAL PRIMARY KEY,
    size INT,
    quantity INT,
    list_price INT,
    sale_price INT
);


