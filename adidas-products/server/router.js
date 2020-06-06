var express = require('express');
var router = express.Router();
const cassandra = require('cassandra-driver');

const client = new cassandra.Client({
    contactPoints: ['127.0.0.1'], // something goes inside
    localDataCenter: 'datacenter1',// name of the datacenter
    keyspace: 'adidas_product'
})

// return function

function jsonMaker(data, call) {

  let responceRow = data.rows[0];
  let visitedColors = [];
  let output = {
    "id": responceRow.shoe_id,
    "name": responceRow.shoe_name,
    "collection_name": responceRow.collection_name,
    "review_count": responceRow.review_count,
    "review_average": responceRow.review_average,
    "colors": []
  }
  for (var i = 0; i < data.rows.length; i++) {
    responceRow = data.rows[i];
    console.log(JSON.stringify(responceRow.color_id))
    if (visitedColors.includes(JSON.stringify(responceRow.color_id))) {
      output.colors[output.colors.length - 1].inventory.push({
        "size": responceRow.size_number,
        "quantity": responceRow.quantity
      });
    } else {
      visitedColors.push(JSON.stringify(responceRow.color_id))
      output.colors.push({
        "id": responceRow.color_id,
        "url": responceRow.color_url,
        "name": responceRow.color_name,
        "list_price": responceRow.list_price,
        "sale_price": responceRow.sale_price,
        "inventory": [
          {
            "size": responceRow.size_number,
            "quantity": responceRow.quantity
          }
        ],
        "images": responceRow.images.split(" ")
      })
    }
  }

  // console.log(output)
  
  return output;
}

// retrieves shoe by size id
router.route('/size_id/:id').get(function(req, res) {

  const query = `SELECT * FROM shoe_by_size_id WHERE "size_id" = ${req.params.id}`;

  client.execute(query,[], (err, data)=> {
    if (err) {
      console.error(err);
      res.send(err);
    } else if (data.rows[0] === undefined){
      res.sendStatus(404);
    } else {
      // console.log(data, "<= data")
      
      res.json(jsonMaker(data));
    }
  });
});

// retrieves shoe by shoe, color and size name
router.route('/shoe_name/:shoe/:color/:size').get(function(req, res) {

  const query = `SELECT * FROM shoe_by_shoe_name_and_color_name WHERE "shoe_name" = ${req.params.shoe},"color_name" = ${req.params.color}, "size_id" = ${req.params.size}`;

  client.execute(query,[], (err, data)=> {
    if (err) {
      console.error(err);
      res.send(err);
    } else if (data.rows[0] === undefined){
      res.sendStatus(404);
    } else {
      // console.log(data, "<= data")
      
      res.json(jsonMaker(data));
    }
  });
});

// retrieves shoes by shoe name
router.route('/shoe_id/:name').get(function(req, res) {

  const query = `SELECT * FROM shoes_by_shoe_name WHERE "shoe_name" = ${req.params.name}`;

  client.execute(query,[], (err, data)=> {
    if (err) {
      console.error(err);
      res.send(err);
    } else if (data.rows[0] === undefined){
      res.sendStatus(404);
    } else {
      // console.log(data, "<= data")
      
      res.json(jsonMaker(data));
    }
  });
});
// retrieves shoes by shoe and color ids
router.route('/shoe_and_color_id/:shoe/:color').get(function(req, res) {

  const query = `SELECT * FROM shoes_sizes_by_shoe_and_color_ids WHERE "shoe_id" = ${req.params.shoe} AND "color_id" = ${req.params.color}`;

  client.execute(query,[], (err, data)=> {
    if (err) {
      console.error(err);
      res.send(err);
    } else if (data.rows[0] === undefined){
      res.sendStatus(404);
    } else {
      // console.log(data, "<= data")
      
      res.json(jsonMaker(data, "shoe_and_color_id"));
    }
  });
});

module.exports = router;
