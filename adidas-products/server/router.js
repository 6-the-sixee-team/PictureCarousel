var express = require('express');
var router = express.Router();
const cassandra = require('cassandra-driver');

const client = new cassandra.Client({
    contactPoints: ['127.0.0.1'], // something goes inside
    localDataCenter: 'datacenter1',// name of the datacenter
    keyspace: 'adidas_product'
})

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
      res.json(data.rows[0]);
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
      res.json(data.rows[0]);
    }
  });
});

// retrieves shoes by shoe name
router.route('/shoe_id/:id').get(function(req, res) {

  const query = `SELECT * FROM shoes_by_shoe_name WHERE "shoe_name" = ${req.params.id}`;

  client.execute(query,[], (err, data)=> {
    if (err) {
      console.error(err);
      res.send(err);
    } else if (data.rows[0] === undefined){
      res.sendStatus(404);
    } else {
      res.json(data.rows);
    }
  });
});
// retrieves shoes by shoe and color ids
router.route('/shoe_and_color_id/:shoe/:color').get(function(req, res) {

  const query = `SELECT * FROM shoes_sizes_by_shoe_and_color_ids WHERE "shoe_id" = ${req.params.shoe}, "color_id" = ${req.params.color}`;

  client.execute(query,[], (err, data)=> {
    if (err) {
      console.error(err);
      res.send(err);
    } else if (data.rows[0] === undefined){
      res.sendStatus(404);
    } else {
      res.json(data.rows[0]);
    }
  });
});

module.exports = router;
