SELECT shoe.shoe_id, shoe.shoe_name, shoe.collection_name, color.color_id, color.color_name, color.color_url, color.images, size.size_id, size.size_name, size.quantity, size.list_price 
FROM shoe
INNER JOIN colors ON shoe.shoe_id = colors.shoe_id 
INNER JOIN color ON colors.color_id = color.color_id
INNER JOIN sizes ON color.color_id = sizes.color_id 
INNER JOIN size ON sizes.size_id = size.size_id
WHERE size.size_id = 968613956659;
