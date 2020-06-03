const cassandra = require('cassandra-driver');

const client = new cassandra.Client({
    contactPoints: ['127.0.0.1'], // something goes inside
    localDataCenter: 'datacenter1',// name of the datacenter
    keyspace: 'adidas_product'
})

// exports = client;