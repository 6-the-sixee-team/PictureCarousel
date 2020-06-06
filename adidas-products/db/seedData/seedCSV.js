 const path = require('path');
 const faker = require('faker');
 
 
 function arrayMaker() {
     let output = [];
     let shoe = faker.random.number({min:1, max:4});
     let color = faker.random.number({min:0, max:4})
     for ( let i = 0; i < faker.random.number({min:2, max:7}); i++) {
         // ? use faker images
            output.push(`PERF00${shoe}_color${color}_pic${i}.jpg`)//"https://loremflickr.com/g/320/240/adidas,shoe")
        };
        return output;
    }
    
    function shoesStockpiler(num) {
        var output = [];
        var outputObj = {};
        
        // ? shoe
        for (var i = 0; i < num / 60; i++) {
            // shoe_id
            outputObj.shoe_id = faker.random.number({min:100000000000, max:999999999999});
            //  shoe_name text,
            shoeNames = ["Ultra Boost","Gazelle", "Samba", "Yeezy", "NMD", "Pharrell Hu NMD", "Yeezy Boost 350 V2", "Superstar", 'Racer', 'Sense Boost', 'MatchBreak', 'Prophere', 'Continental', 'Sobakol', 'Deerupt', 'Kamanda'];
            outputObj.shoe_name = shoeNames[Math.floor(shoeNames.length * Math.random())];
            //  collection_name text,
            collections = ['Running', 'Originals', 'Walking', 'Tennis', 'Essentials'];
            outputObj.collection_name = collections[Math.floor(collections.length * Math.random())];

            // review count, review avg
            outputObj.review_count = faker.random.number({min:1, max:9999});
            outputObj.review_avg = faker.random.number({min:1, max:5});
            
            // ? color
            for ( var j = 0; j < (6 - (faker.random.number({min: 0, max: 2}))); j++) {
                var imagesArr = arrayMaker()
                // color_id
                outputObj.color_id = faker.random.number({min:100000000000, max:999999999999})
                //  color_url text,
                outputObj.color_url = imagesArr[0];
                //  color_name text,
                let color_names = ['Cloud White', 'Dash Grey', 'Solar Red', 'Core Black', 'Flash Orange', 'Carbon', 'Yellow', 'Scarlet', 'Glory Purple', 'Colligarate Navy'];
                outputObj.color_name = color_names[Math.floor(color_names.length * Math.random())] + " / " + color_names[Math.floor(color_names.length * Math.random())] + " / " + color_names[Math.floor(color_names.length * Math.random())];
                //  images text,
                outputObj.images = imagesArr.join(" ");
                //prices
                let price = faker.random.number({min:0, max:1000});
                //  list_price int,
                outputObj.list_price = price;
                //  sale_price int,
                outputObj.sale_price = Math.floor(price * (faker.random.number({min:50, max:100}) / 100))
                
                // ? size
                for (var k = 4; k <= 14; k += 0.5) {
                    // size id
                    outputObj.size_id = faker.random.number({min:100000000000, max:999999999999});
                    outputObj.size_number = `M ${k} / W ${k + 1}`;
                    //  quantity int,
                    outputObj.quantity = faker.random.number({min:0, max:10000});
                    
                    // ? output
                    output.push(JSON.parse(JSON.stringify(outputObj)));
                }
                
            }
        };
        return output;
    }
        
    const createCsvWriter = require('csv-writer').createObjectCsvWriter;
    const csvWriter = createCsvWriter({
        path: path.join(__dirname,'seededCSVFiles','seeded1.csv'),
        header: [
            {id: 'shoe_id', title: 'shoe_id'},
            {id: 'shoe_name', title: 'shoe_name'},
            {id: 'collection_name', title: 'collection_name'},
            // ! review count, review avg
            {id: 'review_count', title: 'review_count'},
            {id: 'review_avg', title: 'review_avg'},
            {id: 'color_id', title: 'color_id'},
            {id: 'color_url', title: 'color_url'},
            {id: 'color_name', title: 'color_name'},
            {id: 'images', title: 'images'},
            //  sale price
            //  list price should be here
            {id: 'list_price', title: 'list_price'},
            {id: 'sale_price', title: 'sale_price'},
            {id: 'size_id', title: 'size_id'},
            {id: 'size_number', title: 'size_number'},
            {id: 'quantity', title: 'quantity'}
            
        ]
    });
    
    csvWriter.writeRecords(shoesStockpiler(1000000))       // returns a promise
    .then(() => {
        console.log('...Done');
    });
    
    /**
     * sample shoe object = 
     * {
     *  -- shoe
     * shoe_id int,-
     shoe_name text,-
        collection_name text,-
        // ! review count, review avg
        -- color
        color_id int, -
        color_url text,-
        color_name text,-
        images text,- USE FAKER IMAGES
        // ! sale price
        // ! list price should be here
        -- size
        size_id
        size_name
        quantity_of_NUM int,-
        list_price_of_NUM int-
     * }
     */