DROP DATABASE IF EXISTS adidas_product;

CREATE DATABASE adidas_product;

\c adidas_product;

CREATE TABLE shoe (
    id SERIAL PRIMARY KEY,
    collection_name varchar(100),
    name varchar(100),
    reviews INT UNIQUE,
    color INT UNIQUE,
    FOREIGN KEY (reviews) REFERENCES reviews,
    FOREIGN KEY (color) REFERENCES colors
);

CREATE TABLE reviews (
    id SERIAL PRIMARY KEY,
    average_rating INT,
    shoe_id INT,
    review_id INT,
    FOREIGN KEY (shoe_id) REFERENCES shoe,
    FOREIGN KEY (review_id) REFERENCES review
);

CREATE TABLE review (
    id SERIAL PRIMARY KEY,
    rating INT,
    content varchar(350)
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
    available BOOLEAN,
    list_price INT,
    sale_price INT
);


