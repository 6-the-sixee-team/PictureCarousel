CREATE DATABASE IF NOT EXISTS example;

-- CREATE DATABASE example;

\c example;

DROP TABLE IF EXISTS shoe_info;
DROP TABLE IF EXISTS shoe;
DROP TABLE IF EXISTS colors;
DROP TABLE IF EXISTS color;
DROP TABLE IF EXISTS sizes;
DROP TABLE IF EXISTS size;

CREATE TABLE shoe_info (
    shoe_id  BIGINT,
    shoe_name varchar(100),
    collection_name varchar(100),
    -- colors_id INT UNIQUE,
    -- FOREIGN KEY (colors_id) REFERENCES colors(id)
-- );

-- CREATE TABLE colors (
--     id SERIAL PRIMARY KEY,
--     shoe_id INT,
--     color_id INT
    -- FOREIGN KEY (shoe_id) REFERENCES shoe (shoe_id),
    -- FOREIGN KEY (color_id) REFERENCES color (color_id)
-- );

-- CREATE TABLE color (
    color_id BIGINT,
    color_url varchar(100),
    color_name varchar(100),
    -- sizes_id BIGINT,
    images VARCHAR(500),
    -- image_1 varchar(100),
    -- image_2 varchar(100),
    -- image_3 varchar(100),
    -- image_4 varchar(100),
    -- image_5 varchar(100),
    -- image_6 varchar(100),
    -- image_7 varchar(100)
    -- FOREIGN KEY (sizes_id) REFERENCES sizes (id)
-- );

-- CREATE TABLE sizes (
--     id SERIAL PRIMARY KEY,
--     color_id BIGINT,
--     size_id INT
    -- FOREIGN KEY (color_id) REFERENCES color (color_id),
    -- FOREIGN KEY (size_id) REFERENCES size (size_id)
-- );

-- CREATE TABLE size (
    size_id BIGINT,
    size_name VARCHAR,
    quantity INT,
    list_price INT
);

\COPY shoe_info (shoe_id, shoe_name, collection_name,color_id,color_url,color_name,images,size_id,size_name,quantity,list_price) FROM '/home/roohanjyot/Documents/Github/adidas_front_end/adidas-products/db/seedData/seededExample.csv' DELIMITER ',' CSV HEADER;

-- ? shoe
-- step 1
CREATE TABLE shoe (LIKE shoe_info);
--step 2
INSERT INTO shoe(shoe_id, collection_name,  shoe_name) 
SELECT DISTINCT ON (shoe_id) shoe_id, shoe_name,collection_name FROM shoe_info;
ALTER TABLE shoe 
    DROP column color_id,
    DROP column color_url,
    DROP column color_name,
    DROP column images,
    DROP column size_id,
    DROP column size_name,
    DROP column quantity,
    DROP column list_price;

-- ? colors
-- step 1
CREATE TABLE colors (LIKE shoe_info);
--step 2
INSERT INTO colors(shoe_id, color_id) 
SELECT DISTINCT ON (color_id) shoe_id, color_id FROM shoe_info;
ALTER TABLE colors
    DROP column shoe_name,
    DROP column collection_name,
    DROP column color_url,
    DROP column color_name,
    DROP column images,
    DROP column size_id,
    DROP column size_name,
    DROP column quantity,
    DROP column list_price;

-- ? color
-- step 1
CREATE TABLE color (LIKE shoe_info);
--step 2
INSERT INTO color(color_id, color_name, color_url, images) 
SELECT DISTINCT ON (color_id) color_id, color_name, color_url, images FROM shoe_info;
ALTER TABLE color
    DROP column shoe_id,
    DROP column shoe_name,
    DROP column collection_name,
    DROP column size_id,
    DROP column size_name,
    DROP column quantity,
    DROP column list_price;

-- ? sizes
-- step 1
CREATE TABLE sizes (LIKE shoe_info);
--step 2
INSERT INTO sizes(color_id, size_id) 
SELECT DISTINCT ON (size_id) color_id, size_id FROM shoe_info;
ALTER TABLE sizes
    DROP column shoe_id,
    DROP column shoe_name,
    DROP column collection_name,
    DROP column color_url,
    DROP column color_name,
    DROP column images,
    DROP column size_name,
    DROP column quantity,
    DROP column list_price;
      
-- ? size
-- step 1
CREATE TABLE size (LIKE shoe_info);
--step 2
INSERT INTO size(size_id, size_name, quantity, list_price) 
SELECT DISTINCT ON (size_id) size_id, size_name, quantity, list_price FROM shoe_info;
ALTER TABLE size
    DROP column shoe_id,
    DROP column shoe_name,
    DROP column collection_name,
    DROP column color_id,
    DROP column color_url,
    DROP column color_name,
    DROP column images;
--step 3
DROP TABLE shoe_info;
