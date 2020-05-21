# Adidas Product View Component
This repo contains react components that mimic the product view component on www.adidas.com

## Looping Slideshow Carousel
![Sample Product Component](proxy/images/main.gif)

## Accessible and Scalable
![Sample Product Component](proxy/images/responsive.gif)

## Interactive User Experience
![Sample Product Component](proxy/images/order.gif)

## Modern UI
![Sample Product Component](proxy/images/magnifying.gif)

## Getting Started


```sh
npm install
npm run react-dev
npm start
```


```sh
docker-compose up
```

# Server API

## Get shoe

<details> 
  <summary>Click To Expand</summary>

  * GET `/api/products/:id`

**Path Parameters :**
  * `id` : product id

**Success Status Code :** `200`

**Returns :** JSON

```json
    {
      "id": "Number",
      "name": "String",
      "collection_name": "String",
      "review_count": "String",
      "review_avg": "String",
      "color": [
        {
          "id": "Number",
          "url": "String",
          "name": "String",
          "list_price": "Number",
          "sale_price": "Number",
          "sizes": [
            {
              "id": "Number",
              "size": "String",
              "quantity": "Number"
            },
            ...
          ]
        },
        ...
      ]
    }
```

</details>

## Add shoe

<details> 
  <summary>Click To Expand</summary>

  * POST `/api/products`

**Success Status Code :** `201`

**Request Body :** JSON (new shoe)

```json
    {
      "id": "Number",
      "name": "String",
      "collection_name": "String",
      "review_count": "String",
      "review_avg": "String",
      "color": [
        {
          "id": "Number",
          "url": "String",
          "name": "String",
          "list_price": "Number",
          "sale_price": "Number",
          "sizes": [
            {
              "id": "Number",
              "size": "String",
              "quantity": "Number"
            },
            ...
          ]
        },
        ...
      ]
    }
```

</details>

## Update shoe

<details> 
  <summary>Click To Expand</summary>

  * PATCH `/api/product/:id`

**Path Parameters :**
  * `id` : product id

**Success Status Code :** `202`

**Request Body :** JSON (updated)

```json
    {
      "id": "Number",
      "name": "String",
      "collection_name": "String",
      "review_count": "String",
      "review_avg": "String"
    }
```

</details>

## Delete shoe

<details> 
  <summary>Click To Expand</summary>

  * DELETE `/api/products/:id`

**Path Parameters :**
  * `id` : product id

**Success Status Code :** `204`

</details>

## Get shoe color

<details> 
  <summary>Click To Expand</summary>

  * GET `/api/products/:id/color/:id`

**Path Parameters :**
  * `id` : product id, color id

**Success Status Code :** `200`

**Returns :** JSON (specific shoe)

```json
    {
        "id": "Number",
        "url": "String",
        "name": "String",
        "list_price": "Number",
        "sale_price": "Number",
        "sizes": [
        {
          "id": "Number",
          "size": "String",
          "quantity": "Number"
        }
        ]
    }
```

</details>

## Add shoe color

<details> 
  <summary>Click To Expand</summary>

  * POST `/api/products/:id/color`

  **Path Parameters:**
  * `id` : product id, color

**Success Status Code :** `201`

**Request Body :** JSON (new color)

```json
    {
        "id": "Number",
        "url": "String",
        "name": "String",
        "list_price": "Number",
        "sale_price": "Number",
        "sizes": [
        {
          "id": "Number",
          "size": "String",
          "quantity": "Number"
        }
        ]
    }
```

</details>

## Update shoe color

<details> 
  <summary>Click To Expand</summary>

  * PATCH `/api/products/:id/color/:id`

**Path Parameters :**
  * `id` : product id, color id

**Success Status Code :** `202`

**Request Body :** JSON (updated color)

```json
    {
        "id": "Number",
        "url": "String",
        "name": "String",
        "list_price": "Number",
        "sale_price": "Number"
    }
```

</details>

## Delete shoe color

<details> 
  <summary>Click To Expand</summary>

* DELETE `/api/products/:id/color/:id`

**Path Parameters :**
  * `id` : product id, color id

**Success Status Code :** `204`

</details>

## Get shoe color sizes

<details> 
  <summary>Click To Expand</summary>

  * GET `/api/products/:id/color/:id/size/:id`

**Path Parameters :**
  * `id` : product id, color id, size id

**Success Status Code :** `200`

**Returns :** JSON (specific shoe size)

```json
    {
      "id": "Number",
      "size": "String",
      "quantity": "Number"
    }
```

</details>

## Add shoe color size

<details> 
  <summary>Click To Expand</summary>

  * POST `/api/products/:id/color/:id`

**Path Parameters :**
  * `id` : product id, color id

**Success Status Code :** `201`

**Request Body :** JSON (new shoe size)

```json
    {
      "id": "Number",
      "size": "String",
      "quantity": "Number"
    }
```
</details>
  
## Update shoe color size
  
<details> 
  <summary>Click To Expand</summary>

  * PUT `/api/products/:id/color/:id`

**Path Parameters :**
  * `id` : product id, color id

**Success Status Code :** `202`

**Request Body**: JSON (updated quantity)

```json
    {
      "id": "Number",
      "size": "String",
      "quantity": "Number"
    }
```
</details>

## Delete shoe size size

<details> 
  <summary>Click To Expand</summary>

* DELETE `/api/products/:id/color/:id/size/:id`

**Path Parameters :**
  * `id` : product id, color id, size id

**Success Status Code :** `204`

</details>