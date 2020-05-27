/**
 * sample shoe object = 
 * {
 *  -- shoe
 * shoe_id int,-
    shoe_name text,-
    collection_name text,-
    -- color
    color_id int, -
    color_url text,-
    color_name text,-
    images text,-
    -- size
    quantity_of_NUM int,-
    list_price_of_NUM int-
 * }
 */

 // shoe maker 
 
 function shoeMaker(shoe_id, imagesArr) {
     let outputObj = {};

     // ! shoe
     // shoe_id
    outputObj.shoe_id = shoe_id;
    //  shoe_name text,
    shoeNames = ["Ultra Boost","Gazelle", "Samba", "Yeezy", "NMD", "Pharrell Hu NMD", "Yeezy Boost 350 V2", "Superstar", 'Racer', 'Sense Boost', 'MatchBreak', 'Prophere', 'Continental', 'Sobakol', 'Deerupt', 'Kamanda'];
    outputObj.shoe_name = shoeNames[Math.floor(shoeNames.length * Math.random())];
    //  collection_name text,
     collections = ['Running', 'Originals', 'Walking', 'Tennis', 'Essentials'];
     outputObj.collection_name = collections[Math.floor(collections.length * Math.random())];
     // ! color
     // color_id
     outputObj.color_id = (Math.random()*1000000000).toFixed(0)
     //  color_url text,
     outputObj.color_url = imagesArr[Math.floor(imagesArr.length * Math.random())];
     //  color_name text,
     let color_names = ['Cloud White', 'Dash Grey', 'Solar Red', 'Core Black', 'Flash Orange', 'Carbon', 'Yellow', 'Scarlet', 'Glory Purple', 'Colligarate Navy'];
     outputObj.color_name = color_names[Math.floor(color_names.length * Math.random())] + " / " + color_names[Math.floor(color_names.length * Math.random())] + " / " + color_names[Math.floor(color_names.length * Math.random())];
     //  images text,
     let start_idx = (Math.floor(imagesArr.length - 10 ) * Math.random());
     let end_idx = start_idx + 10;
     outputObj.images = imagesArr.slice(start_idx, end_idx).join(",");
     // ! size
    //  quantity int,
    //  list_price int,
    for (let i = 7; i <= 13; i += 0.5) {
        sizeAdder(i, outputObj)
    }
     
    return outputObj;
}

 function sizeAdder(size, object) {
     object[ "quantity_of_" + size] = Math.floor(Math.random() * 10000);
     object[ "list_price_of_" + size] = Math.floor(Math.random() * 1000);
    }
    
    const path = require('path');
    const createCsvWriter = require('csv-writer').createObjectCsvWriter;
    const csvWriter = createCsvWriter({
        path: path.join(__dirname, 'seeded.csv'),
        header: [
            {id: 'shoe_id', title: 'SHOE INDEX'},
            {id: 'shoe_name', title: 'SHOE NAME'},
            {id: 'collection_name', title: 'COLLECTION NAME'},
            {id: 'color_id', title: 'COLOR INDEX'},
            {id: 'color_url', title: 'COLOR URL'},
            {id: 'color_name', title: 'COLOR NAME'},
            {id: 'images', title: 'IMAGES'},
            {id: 'quantity_of_7', title: 'QUANTITY OF SIZE 7'},
            {id: 'list_price_of_7', title: 'PRICE OF SIZE 7'},
            {id: 'quantity_of_7.5', title: 'QUANTITY OF SIZE 7.5'},
            {id: 'list_price_of_7.5', title: 'PRICE OF SIZE 7.5'},
            {id: 'quantity_of_8', title: 'QUANTITY OF SIZE 8'},
            {id: 'list_price_of_8', title: 'PRICE OF SIZE 8'},
            {id: 'quantity_of_8.5', title: 'QUANTITY OF SIZE 8.5'},
            {id: 'list_price_of_8.5', title: 'PRICE OF SIZE 8.5'},
            {id: 'quantity_of_9', title: 'QUANTITY OF SIZE 9'},
            {id: 'list_price_of_9', title: 'PRICE OF SIZE 9'},
            {id: 'quantity_of_9.5', title: 'QUANTITY OF SIZE 9.5'},
            {id: 'list_price_of_9.5', title: 'PRICE OF SIZE 9.5'},
            {id: 'quantity_of_10', title: 'QUANTITY OF SIZE 10'},
            {id: 'list_price_of_10', title: 'PRICE OF SIZE 10'},
            {id: 'quantity_of_10.5', title: 'QUANTITY OF SIZE 10.5'},
            {id: 'list_price_of_10.5', title: 'PRICE OF SIZE 10.5'},
            {id: 'quantity_of_11', title: 'QUANTITY OF SIZE 11'},
            {id: 'list_price_of_11', title: 'PRICE OF SIZE 11'},
            {id: 'quantity_of_11.5', title: 'QUANTITY OF SIZE 11.5'},
            {id: 'list_price_of_11.5', title: 'PRICE OF SIZE 11.5'},
            {id: 'quantity_of_12', title: 'QUANTITY OF SIZE 12'},
            {id: 'list_price_of_12', title: 'PRICE OF SIZE 12'},
            {id: 'quantity_of_12.5', title: 'QUANTITY OF SIZE 12.5'},
            {id: 'list_price_of_12.5', title: 'PRICE OF SIZE 12.5'},
            {id: 'quantity_of_13', title: 'QUANTITY OF SIZE 13'},
            {id: 'list_price_of_13', title: 'PRICE OF SIZE 13'}
        ]
    });

    function arrayMaker() {
        let output = [];
        for ( let i = 0; i < 101; i++) {
            output.push(`image_${i}`)
        };
        return output;
    }

    function shoesStockpiler(num) {
        var output = [];
        for (var i = 0; i < num; i++) {
            output.push(shoeMaker(Math.floor(Math.random()*1000000000), arrayMaker()))
        };
        return output;
    }
    
    const records = shoesStockpiler(10000000)
    
    csvWriter.writeRecords(records)       // returns a promise
    .then(() => {
        console.log('...Done');
    });
 