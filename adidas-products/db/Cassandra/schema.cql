CREATE KEYSPACE IF NOT EXISTS adidas_product
WITH replication = {'class' : 'SimpleStrategy', 'replication_factor': 1};

USE adidas_product;

DROP TABLE IF EXISTS shoes_sizes_by_shoe_and_color_ids;
DROP TABLE IF EXISTS shoe_by_size_id;
DROP TABLE IF EXISTS shoes_by_shoe_name;
DROP TABLE IF EXISTS CREATE TABLE shoe_by_shoe_name_and_color_name;

CREATE TABLE shoes_by_shoe_name (
    -- shoe
    shoe_id bigint,
    shoe_name text,
    collection_name text,
    review_count int,
    review_avg smallint,
    -- color
    color_id bigint,
    color_url text,
    color_name text,
    images text,-- ! add something to text in images to make in expand vertically
    list_price int,
    sale_price int,

    -- size
    size_id bigint,
    size_number text,
    quantity int,
    PRIMARY KEY ((shoe_name), color_name)
);

CREATE TABLE shoe_by_shoe_name_and_color_name (
    -- shoe
    shoe_id bigint,
    shoe_name text,
    collection_name text,
    review_count int,
    review_avg smallint,
    -- color
    color_id bigint,
    color_url text,
    color_name text,
    images text,-- ! add something to text in images to make in expand vertically
    list_price int,
    sale_price int,

    -- size
    size_id bigint,
    size_number text,
    quantity int,
    PRIMARY KEY ((shoe_name, color_name, size_number), quantity)
);

CREATE TABLE shoe_by_size_id (
    -- shoe
    shoe_id bigint,
    shoe_name text,
    collection_name text,
    review_count int,
    review_avg smallint,
    -- color
    color_id bigint,
    color_url text,
    color_name text,
    images text,-- ! add something to text in images to make in expand vertically
    list_price int,
    sale_price int,

    -- size
    size_id bigint,
    size_number text,
    quantity int,
    PRIMARY KEY (size_id)
);

CREATE TABLE shoes_sizes_by_shoe_and_color_ids (
    -- shoe
    shoe_id bigint,
    shoe_name text,
    collection_name text,
    review_count int,
    review_avg smallint,
    -- color
    color_id bigint,
    color_url text,
    color_name text,
    images text,-- ! add something to text in images to make in expand vertically
    list_price int,
    sale_price int,

    -- size
    size_id bigint,
    size_number text,
    quantity int,
    PRIMARY KEY ((shoe_id, color_id), size_number)
);

-- shoes_sizes_by_shoe_and_color_ids

COPY adidas_product.shoes_sizes_by_shoe_and_color_ids (shoe_id, shoe_name, collection_name,color_id,color_url,color_name,images,size_id,size_number,quantity,list_price, sale_price, review_avg, review_count) FROM '/home/roohanjyot/Documents/Github/adidas_front_end/adidas-products/db/seedData/seededCSVFiles/seeded1.csv' WITH DELIMITER=',' AND HEADER=TRUE;

COPY adidas_product.shoes_sizes_by_shoe_and_color_ids (shoe_id, shoe_name, collection_name,color_id,color_url,color_name,images,size_id,size_number,quantity,list_price, sale_price, review_avg, review_count) FROM '/home/roohanjyot/Documents/Github/adidas_front_end/adidas-products/db/seedData/seededCSVFiles/seeded2.csv' WITH DELIMITER=',' AND HEADER=TRUE;

COPY adidas_product.shoes_sizes_by_shoe_and_color_ids (shoe_id, shoe_name, collection_name,color_id,color_url,color_name,images,size_id,size_number,quantity,list_price, sale_price, review_avg, review_count) FROM '/home/roohanjyot/Documents/Github/adidas_front_end/adidas-products/db/seedData/seededCSVFiles/seeded3.csv' WITH DELIMITER=',' AND HEADER=TRUE;

COPY adidas_product.shoes_sizes_by_shoe_and_color_ids (shoe_id, shoe_name, collection_name,color_id,color_url,color_name,images,size_id,size_number,quantity,list_price, sale_price, review_avg, review_count) FROM '/home/roohanjyot/Documents/Github/adidas_front_end/adidas-products/db/seedData/seededCSVFiles/seeded4.csv' WITH DELIMITER=',' AND HEADER=TRUE;

COPY adidas_product.shoes_sizes_by_shoe_and_color_ids (shoe_id, shoe_name, collection_name,color_id,color_url,color_name,images,size_id,size_number,quantity,list_price, sale_price, review_avg, review_count) FROM '/home/roohanjyot/Documents/Github/adidas_front_end/adidas-products/db/seedData/seededCSVFiles/seeded5.csv' WITH DELIMITER=',' AND HEADER=TRUE;

COPY adidas_product.shoes_sizes_by_shoe_and_color_ids (shoe_id, shoe_name, collection_name,color_id,color_url,color_name,images,size_id,size_number,quantity,list_price, sale_price, review_avg, review_count) FROM '/home/roohanjyot/Documents/Github/adidas_front_end/adidas-products/db/seedData/seededCSVFiles/seeded6.csv' WITH DELIMITER=',' AND HEADER=TRUE;

COPY adidas_product.shoes_sizes_by_shoe_and_color_ids (shoe_id, shoe_name, collection_name,color_id,color_url,color_name,images,size_id,size_number,quantity,list_price, sale_price, review_avg, review_count) FROM '/home/roohanjyot/Documents/Github/adidas_front_end/adidas-products/db/seedData/seededCSVFiles/seeded7.csv' WITH DELIMITER=',' AND HEADER=TRUE;

COPY adidas_product.shoes_sizes_by_shoe_and_color_ids (shoe_id, shoe_name, collection_name,color_id,color_url,color_name,images,size_id,size_number,quantity,list_price, sale_price, review_avg, review_count) FROM '/home/roohanjyot/Documents/Github/adidas_front_end/adidas-products/db/seedData/seededCSVFiles/seeded8.csv' WITH DELIMITER=',' AND HEADER=TRUE;

COPY adidas_product.shoes_sizes_by_shoe_and_color_ids (shoe_id, shoe_name, collection_name,color_id,color_url,color_name,images,size_id,size_number,quantity,list_price, sale_price, review_avg, review_count) FROM '/home/roohanjyot/Documents/Github/adidas_front_end/adidas-products/db/seedData/seededCSVFiles/seeded9.csv' WITH DELIMITER=',' AND HEADER=TRUE;

COPY adidas_product.shoes_sizes_by_shoe_and_color_ids (shoe_id, shoe_name, collection_name,color_id,color_url,color_name,images,size_id,size_number,quantity,list_price, sale_price, review_avg, review_count) FROM '/home/roohanjyot/Documents/Github/adidas_front_end/adidas-products/db/seedData/seededCSVFiles/seeded10.csv' WITH DELIMITER=',' AND HEADER=TRUE;


-- shoe_by_size_id 


COPY adidas_product.shoe_by_size_id (shoe_id, shoe_name, collection_name,color_id,color_url,color_name,images,size_id,size_number,quantity,list_price, sale_price, review_avg, review_count) FROM '/home/roohanjyot/Documents/Github/adidas_front_end/adidas-products/db/seedData/seededCSVFiles/seeded1.csv' WITH DELIMITER=',' AND HEADER=TRUE;

COPY adidas_product.shoe_by_size_id (shoe_id, shoe_name, collection_name,color_id,color_url,color_name,images,size_id,size_number,quantity,list_price, sale_price, review_avg, review_count) FROM '/home/roohanjyot/Documents/Github/adidas_front_end/adidas-products/db/seedData/seededCSVFiles/seeded2.csv' WITH DELIMITER=',' AND HEADER=TRUE;

COPY adidas_product.shoe_by_size_id (shoe_id, shoe_name, collection_name,color_id,color_url,color_name,images,size_id,size_number,quantity,list_price, sale_price, review_avg, review_count) FROM '/home/roohanjyot/Documents/Github/adidas_front_end/adidas-products/db/seedData/seededCSVFiles/seeded3.csv' WITH DELIMITER=',' AND HEADER=TRUE;

COPY adidas_product.shoe_by_size_id (shoe_id, shoe_name, collection_name,color_id,color_url,color_name,images,size_id,size_number,quantity,list_price, sale_price, review_avg, review_count) FROM '/home/roohanjyot/Documents/Github/adidas_front_end/adidas-products/db/seedData/seededCSVFiles/seeded4.csv' WITH DELIMITER=',' AND HEADER=TRUE;

COPY adidas_product.shoe_by_size_id (shoe_id, shoe_name, collection_name,color_id,color_url,color_name,images,size_id,size_number,quantity,list_price, sale_price, review_avg, review_count) FROM '/home/roohanjyot/Documents/Github/adidas_front_end/adidas-products/db/seedData/seededCSVFiles/seeded5.csv' WITH DELIMITER=',' AND HEADER=TRUE;

COPY adidas_product.shoe_by_size_id (shoe_id, shoe_name, collection_name,color_id,color_url,color_name,images,size_id,size_number,quantity,list_price, sale_price, review_avg, review_count) FROM '/home/roohanjyot/Documents/Github/adidas_front_end/adidas-products/db/seedData/seededCSVFiles/seeded6.csv' WITH DELIMITER=',' AND HEADER=TRUE;

COPY adidas_product.shoe_by_size_id (shoe_id, shoe_name, collection_name,color_id,color_url,color_name,images,size_id,size_number,quantity,list_price, sale_price, review_avg, review_count) FROM '/home/roohanjyot/Documents/Github/adidas_front_end/adidas-products/db/seedData/seededCSVFiles/seeded7.csv' WITH DELIMITER=',' AND HEADER=TRUE;

COPY adidas_product.shoe_by_size_id (shoe_id, shoe_name, collection_name,color_id,color_url,color_name,images,size_id,size_number,quantity,list_price, sale_price, review_avg, review_count) FROM '/home/roohanjyot/Documents/Github/adidas_front_end/adidas-products/db/seedData/seededCSVFiles/seeded8.csv' WITH DELIMITER=',' AND HEADER=TRUE;

COPY adidas_product.shoe_by_size_id (shoe_id, shoe_name, collection_name,color_id,color_url,color_name,images,size_id,size_number,quantity,list_price, sale_price, review_avg, review_count) FROM '/home/roohanjyot/Documents/Github/adidas_front_end/adidas-products/db/seedData/seededCSVFiles/seeded9.csv' WITH DELIMITER=',' AND HEADER=TRUE;

COPY adidas_product.shoe_by_size_id (shoe_id, shoe_name, collection_name,color_id,color_url,color_name,images,size_id,size_number,quantity,list_price, sale_price, review_avg, review_count) FROM '/home/roohanjyot/Documents/Github/adidas_front_end/adidas-products/db/seedData/seededCSVFiles/seeded10.csv' WITH DELIMITER=',' AND HEADER=TRUE;


-- shoes_by_shoe_name


COPY adidas_product.shoes_by_shoe_name (shoe_id, shoe_name, collection_name,color_id,color_url,color_name,images,size_id,size_number,quantity,list_price, sale_price, review_avg, review_count) FROM '/home/roohanjyot/Documents/Github/adidas_front_end/adidas-products/db/seedData/seededCSVFiles/seeded1.csv' WITH DELIMITER=',' AND HEADER=TRUE;

COPY adidas_product.shoes_by_shoe_name (shoe_id, shoe_name, collection_name,color_id,color_url,color_name,images,size_id,size_number,quantity,list_price, sale_price, review_avg, review_count) FROM '/home/roohanjyot/Documents/Github/adidas_front_end/adidas-products/db/seedData/seededCSVFiles/seeded2.csv' WITH DELIMITER=',' AND HEADER=TRUE;

COPY adidas_product.shoes_by_shoe_name (shoe_id, shoe_name, collection_name,color_id,color_url,color_name,images,size_id,size_number,quantity,list_price, sale_price, review_avg, review_count) FROM '/home/roohanjyot/Documents/Github/adidas_front_end/adidas-products/db/seedData/seededCSVFiles/seeded3.csv' WITH DELIMITER=',' AND HEADER=TRUE;

COPY adidas_product.shoes_by_shoe_name (shoe_id, shoe_name, collection_name,color_id,color_url,color_name,images,size_id,size_number,quantity,list_price, sale_price, review_avg, review_count) FROM '/home/roohanjyot/Documents/Github/adidas_front_end/adidas-products/db/seedData/seededCSVFiles/seeded4.csv' WITH DELIMITER=',' AND HEADER=TRUE;

COPY adidas_product.shoes_by_shoe_name (shoe_id, shoe_name, collection_name,color_id,color_url,color_name,images,size_id,size_number,quantity,list_price, sale_price, review_avg, review_count) FROM '/home/roohanjyot/Documents/Github/adidas_front_end/adidas-products/db/seedData/seededCSVFiles/seeded5.csv' WITH DELIMITER=',' AND HEADER=TRUE;

COPY adidas_product.shoes_by_shoe_name (shoe_id, shoe_name, collection_name,color_id,color_url,color_name,images,size_id,size_number,quantity,list_price, sale_price, review_avg, review_count) FROM '/home/roohanjyot/Documents/Github/adidas_front_end/adidas-products/db/seedData/seededCSVFiles/seeded6.csv' WITH DELIMITER=',' AND HEADER=TRUE;

COPY adidas_product.shoes_by_shoe_name (shoe_id, shoe_name, collection_name,color_id,color_url,color_name,images,size_id,size_number,quantity,list_price, sale_price, review_avg, review_count) FROM '/home/roohanjyot/Documents/Github/adidas_front_end/adidas-products/db/seedData/seededCSVFiles/seeded7.csv' WITH DELIMITER=',' AND HEADER=TRUE;

COPY adidas_product.shoes_by_shoe_name (shoe_id, shoe_name, collection_name,color_id,color_url,color_name,images,size_id,size_number,quantity,list_price, sale_price, review_avg, review_count) FROM '/home/roohanjyot/Documents/Github/adidas_front_end/adidas-products/db/seedData/seededCSVFiles/seeded8.csv' WITH DELIMITER=',' AND HEADER=TRUE;

COPY adidas_product.shoes_by_shoe_name (shoe_id, shoe_name, collection_name,color_id,color_url,color_name,images,size_id,size_number,quantity,list_price, sale_price, review_avg, review_count) FROM '/home/roohanjyot/Documents/Github/adidas_front_end/adidas-products/db/seedData/seededCSVFiles/seeded9.csv' WITH DELIMITER=',' AND HEADER=TRUE;

COPY adidas_product.shoes_by_shoe_name (shoe_id, shoe_name, collection_name,color_id,color_url,color_name,images,size_id,size_number,quantity,list_price, sale_price, review_avg, review_count) FROM '/home/roohanjyot/Documents/Github/adidas_front_end/adidas-products/db/seedData/seededCSVFiles/seeded10.csv' WITH DELIMITER=',' AND HEADER=TRUE;


-- shoe_by_shoe_name_and_color_name


COPY adidas_product.shoe_by_shoe_name_and_color_name (shoe_id, shoe_name, collection_name,color_id,color_url,color_name,images,size_id,size_number,quantity,list_price, sale_price, review_avg, review_count) FROM '/home/roohanjyot/Documents/Github/adidas_front_end/adidas-products/db/seedData/seededCSVFiles/seeded1.csv' WITH DELIMITER=',' AND HEADER=TRUE;

COPY adidas_product.shoe_by_shoe_name_and_color_name (shoe_id, shoe_name, collection_name,color_id,color_url,color_name,images,size_id,size_number,quantity,list_price, sale_price, review_avg, review_count) FROM '/home/roohanjyot/Documents/Github/adidas_front_end/adidas-products/db/seedData/seededCSVFiles/seeded2.csv' WITH DELIMITER=',' AND HEADER=TRUE;

COPY adidas_product.shoe_by_shoe_name_and_color_name (shoe_id, shoe_name, collection_name,color_id,color_url,color_name,images,size_id,size_number,quantity,list_price, sale_price, review_avg, review_count) FROM '/home/roohanjyot/Documents/Github/adidas_front_end/adidas-products/db/seedData/seededCSVFiles/seeded3.csv' WITH DELIMITER=',' AND HEADER=TRUE;

COPY adidas_product.shoe_by_shoe_name_and_color_name (shoe_id, shoe_name, collection_name,color_id,color_url,color_name,images,size_id,size_number,quantity,list_price, sale_price, review_avg, review_count) FROM '/home/roohanjyot/Documents/Github/adidas_front_end/adidas-products/db/seedData/seededCSVFiles/seeded4.csv' WITH DELIMITER=',' AND HEADER=TRUE;

COPY adidas_product.shoe_by_shoe_name_and_color_name (shoe_id, shoe_name, collection_name,color_id,color_url,color_name,images,size_id,size_number,quantity,list_price, sale_price, review_avg, review_count) FROM '/home/roohanjyot/Documents/Github/adidas_front_end/adidas-products/db/seedData/seededCSVFiles/seeded5.csv' WITH DELIMITER=',' AND HEADER=TRUE;

COPY adidas_product.shoe_by_shoe_name_and_color_name (shoe_id, shoe_name, collection_name,color_id,color_url,color_name,images,size_id,size_number,quantity,list_price, sale_price, review_avg, review_count) FROM '/home/roohanjyot/Documents/Github/adidas_front_end/adidas-products/db/seedData/seededCSVFiles/seeded6.csv' WITH DELIMITER=',' AND HEADER=TRUE;

COPY adidas_product.shoe_by_shoe_name_and_color_name (shoe_id, shoe_name, collection_name,color_id,color_url,color_name,images,size_id,size_number,quantity,list_price, sale_price, review_avg, review_count) FROM '/home/roohanjyot/Documents/Github/adidas_front_end/adidas-products/db/seedData/seededCSVFiles/seeded7.csv' WITH DELIMITER=',' AND HEADER=TRUE;

COPY adidas_product.shoe_by_shoe_name_and_color_name (shoe_id, shoe_name, collection_name,color_id,color_url,color_name,images,size_id,size_number,quantity,list_price, sale_price, review_avg, review_count) FROM '/home/roohanjyot/Documents/Github/adidas_front_end/adidas-products/db/seedData/seededCSVFiles/seeded8.csv' WITH DELIMITER=',' AND HEADER=TRUE;

COPY adidas_product.shoe_by_shoe_name_and_color_name (shoe_id, shoe_name, collection_name,color_id,color_url,color_name,images,size_id,size_number,quantity,list_price, sale_price, review_avg, review_count) FROM '/home/roohanjyot/Documents/Github/adidas_front_end/adidas-products/db/seedData/seededCSVFiles/seeded9.csv' WITH DELIMITER=',' AND HEADER=TRUE;

COPY adidas_product.shoe_by_shoe_name_and_color_name (shoe_id, shoe_name, collection_name,color_id,color_url,color_name,images,size_id,size_number,quantity,list_price, sale_price, review_avg, review_count) FROM '/home/roohanjyot/Documents/Github/adidas_front_end/adidas-products/db/seedData/seededCSVFiles/seeded10.csv' WITH DELIMITER=',' AND HEADER=TRUE;