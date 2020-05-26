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
    PRIMARY KEY (shoe_id, color_id)
) WITH CLUSTERING ORDER BY (color_id);