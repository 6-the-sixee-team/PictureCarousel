CREATE KEYSPACE IF NOT EXISTS adidas_product
WITH replication = {'class' : 'SimpleStrategy', 'replication_factor': 3};

USE adidas_product;

CREATE TABLE shoe (
    shoe_id uuid,
    name text,
    collection_name text,
    review_count int,
    review_avg int,
    color_id int,
    color_url text,
    color_name text,
    list_price int,
    sale_price int,
    size text,
    quantity int,
    image text
    PRIMARY KEY (shoe_id)
) WITH CLUSTERING ORDER BY (color_id);
-- --to query for prices
-- CREATE TABLE prices_by_date (
--   package_id uuid,
--   trip_id uuid,
--   trip_date date,
--   price smallint,
--   PRIMARY KEY (package_id, trip_id)
-- ) WITH CLUSTERING ORDER BY (trip_id ASC);

-- --to query for trips
-- CREATE TABLE trips (
--   trip_id uuid,
--   available boolean,
--   detail text,
--   duration int,
--   PRIMARY KEY (trip_id, available, duration)
-- ) WITH CLUSTERING ORDER BY (available DESC, duration ASC);