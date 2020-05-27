CREATE KEYSPACE IF NOT EXISTS adidas_product
WITH replication = {'class' : 'SimpleStrategy', 'replication_factor': 3};

USE adidas_product;

CREATE TABLE shoe (
    -- shoe
    shoe_id uuid,
    shoe_name text,
    collection_name text,
    -- review
    reviews_average_rating int,
    review_id int,
    review_rating int,
    review_title text,
    review_content text,
    -- color
    colors_id int,
    color_url text,
    color_name text,
    images text,-- ! add something to text in images to make in expand vertically
    -- size
    size_id int,
    size int,
    quantity int,
    list_price int,
    sale_price int
    PRIMARY KEY (shoe_id, color_id)
) WITH CLUSTERING ORDER BY (color_id);