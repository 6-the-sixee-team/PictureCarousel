import React, { Component, Fragment } from 'react';
import ProductInfo from './ProductInfo.jsx';
import Header from './Header.jsx';
import $ from 'jquery';


const data = require('../../../db/data.json');
const shoe_id = 261639169068;
const color_id = 368161687743;


// const url = `http://127.0.0.1:3001/api/size_id/`
//const url = localhost:3001/api/size_id/925702056754

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      product: data[3]
    }
  }


  // Fetches a random product from the database
  componentDidMount() {
    console.log('%cHIRE ME! PLEASE!', 'color: red');
    console.log('https://www.linkedin.com/in/Roohanjyot/');
    let randomId;

    // to fetch a random product, uncomment this
    //randomId = this.randomProductId();

    // to fetch a complete product for demonstration purposes 
    // uncomment this for IDs: PERF001, PERF002, PERF003, PERF004
    // randomId = 383099078852;

    this.fetchProduct();

    // Below is a list of product IDs that look particularly good
    // EF4974, BD7633, EE8862, FY0728, G27707, EE7161, FX8003, EH0249, FV3743; EH0249;
    // this.fetchProduct('FV3642'); // FV3743
  }

  // Generates a random product ID
  randomProductId() {
    let index = Math.floor(Math.random() * data.length);
    return data[index].id;
  }

  // Fetches product details for a given product ID
  // and sets the state
  fetchProduct() {
    $.ajax({
      url: `http://127.0.0.1:3001/api/shoe_and_color_id/${shoe_id}/${color_id}`, //261639169068 shoe 368161687743 color
      method: 'get',
      dataType: 'json',
      success: (product) => {
        // console.log("compond fetching")
        this.setState({product})
      },
      error: (err) => console.log(err)
    })
  }

  render() {
    return(
      <Fragment>
        <Header />
        <ProductInfo product={this.state.product}/>
      </Fragment>
    )
  }
}

export default App;