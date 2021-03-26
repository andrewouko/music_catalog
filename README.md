### Start Application

**Install dependencies using npm :**

`npm install`

**Create .env file in `the project root folder` with following variables :**

-   `PORT` : This is the port where the applicationw will be running from
-   `APP_NAME` : This is a name for the application. It helps with creating 
-   `HOST` : This database hostname
-   `USER` : This is the database user
-   `PASSWORD` : This is the database password

*A sample is provided in the project root*

**Run the development server using the scripts provided in package.json :**

`npm run start`

*Application will now be accessible from the port provided in the .env file*

**Activity & Error Logging  Files :**

- `catalog_api.log`
- `error.log`

*Located in the root of the project and must be writable*

**Install the mysql database using the music_catalog.sql file :**

`music_catalog.sql`

*Located in the root of the project*

**TEST IF APPLICATION IS INSTALLED CORRECTLY :**

`http://host:port/status` e.g http:localhost:4000/status


**MUSIC CATALOG REST API**
----
  <_Once installed the application provides the following web services. The samples provided below assume the application is running on http:localhost:4000_>

## Health

* **URL: `/health`**

  <_This service checks whether the api is available_>

* **Method:**
  `GET`

* **Success Response:**
  * **Code:** 200 <br />
  * **Content-type:** text/html <br />
    **Body:** `Ok`
 
* **Error Response:**
  * **Code:** 404 NOT FOUND <br />

* **Sample Call:**
curl --location --request GET 'localhost:4000/health'

* **Notes:**
  <_This is a ping service that can allow cloud platforms mark the service as available._> 

## Status

* **URL: `/status`**

  <_This service checks whether the application running the service is properly configured.>

* **Method:**
  `GET`

* **Success Response:**
  * **Code:** 200 <br />
  * **Content-type:** application/json <br />
    **Body:** 
```json
        {
    "ip": "::1",
    "health": "Ok",
    "env": {
        "port": "Set",
        "app_name": "Set",
        "HOST": "Set",
        "USER": "Set",
        "PASSWORD": "Set",
        "DB": "Set"
    }
}
```
* **Error Response:**
  * **Code:** 404 NOT FOUND <br />

* **Sample Call:**
curl --location --request GET 'localhost:4000/status'

* **Notes:**
  <_This is a ping service that checks if the environment is properly configured and returns the client's ip._> 


# Genres

* **URL: `/genre`**

  <_Genre List_>

* **Method:**
  `GET`

* **Success Response:**
  * **Code:** 200 <br />
  * **Content-type:** application/json <br />
    **Body:** 
```json
{
    "status": 200,
    "message": "Successful listing of genre",
    "data": [
        {
            "name": "Blues",
            "date_added": "2021-03-24T22:02:35.000Z",
            "date_updated": null
        },
        {
            "name": "Jazz",
            "date_added": "2021-03-24T22:01:48.000Z",
            "date_updated": null
        },
        {
            "name": "R&B",
            "date_added": "2021-03-24T22:02:35.000Z",
            "date_updated": null
        },
        {
            "name": "Rap",
            "date_added": "2021-03-24T22:02:35.000Z",
            "date_updated": null
        },
        {
            "name": "Rock",
            "date_added": "2021-03-24T22:01:48.000Z",
            "date_updated": null
        },
        {
            "name": "Soul",
            "date_added": "2021-03-24T22:02:35.000Z",
            "date_updated": null
        }
    ]
}
```
* **Error Response:**
  * **Code:** 404 NOT FOUND <br />

* **Sample Call:**
curl --location --request GET 'localhost:4000/genres'

* **Notes:**
  <_This endpoint lists the genres that are saved in the genre table._> 

### Genre by name

* **URL: `/genre/:name`**

  <_Genre List by Name_>

* **Method:**
  `GET`

* **Success Response:**
  * **Code:** 200 <br />
  * **Content-type:** application/json <br />
    **Body:** 
```json
{
    "status": 200,
    "message": "Successful listing of genre",
    "data": [
        {
            "name": "R&B",
            "date_added": "2021-03-24T22:02:35.000Z",
            "date_updated": null
        }
    ]
}
```
* **Error Response:**
  * **Code:** 404  <br />

* **Error Response:**
  * **Code:** 400 Bad Reqeust  <br />
  * **Content-type:** application/json <br />
    **Body:** 
```json
{
    "status": 400,
    "message": "Get list validation failed",
    "error": [
        {
            "value": "not existing",
            "msg": "genre name xxsamplexx does not exist",
            "param": "name",
            "location": "params"
        }
    ]
}
```
* **Sample Call:**
curl --location --request GET 'localhost:4000/genres/blues'

* **Notes:**
  <_This endpoint lists the genres that are saved in the genre table filtered by the primary key name._> 
# Artist

* **URL: `/artists`**

  <_Artist List_>

* **Method:**
  `GET`

* **Success Response:**
  * **Code:** 200 <br />
  * **Content-type:** application/json <br />
    **Body:** 
```json
{
    "status": 200,
    "message": "Successful listing of artist",
    "data": [
        {
            "name": "Sample Artist 1",
            "date_added": "2021-03-24T22:07:03.000Z",
            "date_updated": null
        },
        {
            "name": "Sample Artist 2",
            "date_added": "2021-03-24T22:07:03.000Z",
            "date_updated": null
        },
        {
            "name": "Sample Artist 3",
            "date_added": "2021-03-24T22:07:03.000Z",
            "date_updated": null
        },
        {
            "name": "Sample Artist 4",
            "date_added": "2021-03-24T22:07:22.000Z",
            "date_updated": null
        },
        {
            "name": "Sample Artist 5",
            "date_added": "2021-03-24T22:07:22.000Z",
            "date_updated": null
        },
        {
            "name": "Sample Artist 6",
            "date_added": "2021-03-24T22:07:22.000Z",
            "date_updated": null
        }
    ]
}
```
* **Error Response:**
  * **Code:** 404 NOT FOUND <br />

* **Sample Call:**
curl --location --request GET 'localhost:4000/artists'

* **Notes:**
  <_This endpoint lists the artists that are saved the artist table._> 

### Artist by name

* **URL: `/artist/:name`**

  <_Artist List by Name_>

* **Method:**
  `GET`

* **Success Response:**
  * **Code:** 200 <br />
  * **Content-type:** application/json <br />
    **Body:** 
```json
{
    "status": 200,
    "message": "Successful listing of artist",
    "data": [
        {
            "name": "Sample Artist 1",
            "date_added": "2021-03-24T22:07:03.000Z",
            "date_updated": null
        }
    ]
}
```
* **Error Response:**
  * **Code:** 404 NOT FOUND <br />

* **Error Response:**
  * **Code:** 400 Bad Reqeust  <br />
  * **Content-type:** application/json <br />
    **Body:** 
```json
{
    "status": 400,
    "message": "Get list validation failed",
    "error": [
        {
            "value": "Sample",
            "msg": "artist name Sample does not exist",
            "param": "name",
            "location": "params"
        }
    ]
}
```
* **Sample Call:**
curl --location --request GET 'localhost:4000/artists/Sample Artist 1'

* **Notes:**
  <_This endpoint lists the artists that are saved in the artist table filtered by the primary key name._> 


### Artist by genre

* **URL: `/artist/:genre/genre`**

  <_Artist List by Name_>

* **Method:**
  `GET`

* **Success Response:**
  * **Code:** 200 <br />
  * **Content-type:** application/json <br />
    **Body:** 
```json
{
    "status": 200,
    "message": "Successful listing of artist",
    "data": [
        {
            "name": "Sample Artist 1",
            "date_added": "2021-03-24T22:07:03.000Z",
            "date_updated": null
        },
        {
            "name": "Sample Artist 2",
            "date_added": "2021-03-24T22:07:03.000Z",
            "date_updated": null
        }
    ]
}
```
* **Error Response:**
  * **Code:** 404 NOT FOUND <br />

* **Error Response:**
  * **Code:** 400 Bad Reqeust  <br />
  * **Content-type:** application/json <br />
    **Body:** 
```json
{
    "status": 400,
    "message": "Get list validation failed",
    "error": [
        {
            "value": "reds",
            "msg": "Query returned an empty result",
            "param": "genre",
            "location": "params"
        }
    ]
}
```
* **Sample Call:**
curl --location --request GET 'localhost:4000/artists/blues/genre'

* **Notes:**
  <_This endpoint lists the artists that are saved in the artist table filtered by genre._> 

# Albums

* **URL: `/albums`**

  <_Album List_>

* **Method:**
  `GET`

* **Success Response:**
  * **Code:** 200 <br />
  * **Content-type:** application/json <br />
    **Body:** 
```json
{
    "status": 200,
    "message": "Successful listing of album",
    "data": [
        {
            "name": "Album 1",
            "genre": "Blues",
            "artist": "Sample Artist 1",
            "date_added": "2021-03-24T22:08:43.000Z",
            "date_updated": null
        },
        {
            "name": "Album 2",
            "genre": "Blues",
            "artist": "Sample Artist 2",
            "date_added": "2021-03-24T22:09:52.000Z",
            "date_updated": null
        },
        {
            "name": "Album 3",
            "genre": "Soul",
            "artist": "Sample Artist 2",
            "date_added": "2021-03-24T22:10:52.000Z",
            "date_updated": null
        },
        {
            "name": "Album 4",
            "genre": "R&B",
            "artist": "Sample Artist 3",
            "date_added": "2021-03-24T22:10:52.000Z",
            "date_updated": null
        },
        {
            "name": "Album 5",
            "genre": "Rock",
            "artist": "Sample Artist 3",
            "date_added": "2021-03-24T22:10:52.000Z",
            "date_updated": null
        },
        {
            "name": "Album Test",
            "genre": "Soul",
            "artist": "Sample Artist 4",
            "date_added": "2021-03-25T15:33:47.000Z",
            "date_updated": null
        }
    ]
}
```
* **Error Response:**
  * **Code:** 404 NOT FOUND <br />

* **Sample Call:**
curl --location --request GET 'localhost:4000/albums'

* **Notes:**
  <_This endpoint lists the albums that are saved the album table._> 

### Artist by name

* **URL: `/albums/:name`**

  <_Album List by Name_>

* **Method:**
  `GET`

* **Success Response:**
  * **Code:** 200 <br />
  * **Content-type:** application/json <br />
    **Body:** 
```json
{
    "status": 200,
    "message": "Successful listing of album",
    "data": [
        {
            "name": "Album 1",
            "genre": "Blues",
            "artist": "Sample Artist 1",
            "date_added": "2021-03-24T22:08:43.000Z",
            "date_updated": null
        }
    ]
}
```
* **Error Response:**
  * **Code:** 404 NOT FOUND <br />

* **Error Response:**
  * **Code:** 400 Bad Reqeust  <br />
  * **Content-type:** application/json <br />
    **Body:** 
```json
{
    "status": 400,
    "message": "Get list validation failed",
    "error": [
        {
            "value": "Album 100",
            "msg": "album name Album 100 does not exist",
            "param": "name",
            "location": "params"
        }
    ]
}
```
* **Sample Call:**
curl --location --request GET 'localhost:4000/albums/Album 1'

* **Notes:**
  <_This endpoint lists the albums that are saved in the artist table filtered by primary key name._> 

### Album by genre

* **URL: `/albums/:genre/genre`**

  <_Album List by Genre_>

* **Method:**
  `GET`

* **Success Response:**
  * **Code:** 200 <br />
  * **Content-type:** application/json <br />
    **Body:** 
```json
{
    "status": 200,
    "message": "Successful listing of album",
    "data": [
        {
            "name": "Album 1",
            "genre": "Blues",
            "artist": "Sample Artist 1",
            "date_added": "2021-03-24T22:08:43.000Z",
            "date_updated": null
        },
        {
            "name": "Album 2",
            "genre": "Blues",
            "artist": "Sample Artist 2",
            "date_added": "2021-03-24T22:09:52.000Z",
            "date_updated": null
        }
    ]
}
```
* **Error Response:**
  * **Code:** 404 NOT FOUND <br />

* **Error Response:**
  * **Code:** 400 Bad Reqeust  <br />
  * **Content-type:** application/json <br />
    **Body:** 
```json
{
    "status": 400,
    "message": "Get list validation failed",
    "error": [
        {
            "value": "reds",
            "msg": "album genre reds does not exist",
            "param": "genre",
            "location": "params"
        }
    ]
}
```
* **Sample Call:**
curl --location --request GET 'localhost:4000/albums/Album 1'

* **Notes:**
  <_This endpoint lists the albums that are saved in the album table filtered by genre._> 


### Album by artist

* **URL: `/albums/:genre/artist`**

  <_Artist Albums List_>

* **Method:**
  `GET`

* **Success Response:**
  * **Code:** 200 <br />
  * **Content-type:** application/json <br />
    **Body:** 
```json
{
    "status": 200,
    "message": "Successful listing of album",
    "data": [
        {
            "name": "Album 1",
            "genre": "Blues",
            "artist": "Sample Artist 1",
            "date_added": "2021-03-24T22:08:43.000Z",
            "date_updated": null
        }
    ]
}
```
* **Error Response:**
  * **Code:** 404 NOT FOUND <br />

* **Error Response:**
  * **Code:** 400 Bad Reqeust  <br />
  * **Content-type:** application/json <br />
    **Body:** 
```json
{
    "status": 400,
    "message": "Get list validation failed",
    "error": [
        {
            "value": "reds",
            "msg": "album genre reds does not exist",
            "param": "genre",
            "location": "params"
        }
    ]
}
```
* **Sample Call:**
curl --location --request GET 'localhost:4000/albums/Sample Artist 1/artist'

* **Notes:**
  <_This endpoint lists the albums that are saved in the album table filtered by genre._> 

# Cart

* **URL: `/cart`**

  <_Add to cart_>

* **Method:**
  `POST`

* **Data Params for an Album addition**
```json
{"album": "Album 1"}
```
* **Data Params for an Song addition**
```json
{"song": "Song 1"}
```

* **Success Response:**
  * **Code:** 200 <br />
  * **Content-type:** application/json <br />
    **Body:** 
```json
{
    "status": 200,
    "message": "Successfully added to cart",
    "data": {
        "id": 49,
        "album": "Album 1",
        "client_ip": "::1"
    }
}
```
* **Error Response:**
  * **Code:** 404 NOT FOUND <br />

* **Error Response:**
  * **Code:** 400 Bad Reqeust  <br />
  * **Content-type:** application/json <br />
    **Body:** 
```json
{
    "status": 400,
    "message": "Add to cart validation failed",
    "error": [
        {
            "msg": "Invalid value(s)",
            "param": "_error",
            "nestedErrors": [
                {
                    "msg": "Invalid value",
                    "param": "song",
                    "location": "body"
                },
                {
                    "msg": "song name undefined does not exist",
                    "param": "song",
                    "location": "body"
                },
                {
                    "value": "Album 100",
                    "msg": "album name Album 100 does not exist",
                    "param": "album",
                    "location": "body"
                }
            ]
        }
    ]
}
```

* **Sample Call:**
curl --location --request POST 'localhost:4000/cart' \
--header 'Content-Type: application/json' \
--data-raw '{"album": "Album 1"}'

* **Notes:**
  <_This endpoint adds an item to the cart table._> 

### Cart items


* **URL: `/cart`**

  <_List items in a particular client's cart_>

* **Method:**
  `GET`

* **Success Response:**
  * **Code:** 200 <br />
  * **Content-type:** application/json <br />
    **Body:** 
```json
{
    "status": 200,
    "message": "Successful listing of cart",
    "data": [
        {
            "ID": 49,
            "client_ip": "::1",
            "song": null,
            "album": "Album 1",
            "isPurchased": 0
        },
        {
            "ID": 50,
            "client_ip": "::1",
            "song": null,
            "album": "Album 1",
            "isPurchased": 0
        }
    ]
}
```
* **Error Response:**
  * **Code:** 404 NOT FOUND <br />

* **Sample Call:**
curl --location --request GET 'localhost:4000/cart'

* **Notes:**
  <_This endpoint lists the current cart items for a given client ip address as saved in the database._> 
### Cart purchase (Order)

* **URL: `/cart`**

  <_Add to cart_>

* **Method:**
  `PUT`

* **Success Response:**
  * **Code:** 200 <br />
  * **Content-type:** application/json <br />
    **Body:** 
```json
{
    "status": 200,
    "message": "Successfully purchased cart",
    "data": {
        "fieldCount": 0,
        "affectedRows": 45,
        "insertId": 0,
        "serverStatus": 2,
        "warningCount": 0,
        "message": ")Rows matched: 45  Changed: 2  Warnings: 0",
        "protocol41": true,
        "changedRows": 2
    }
}
```
* **Error Response:**
  * **Code:** 404 NOT FOUND <br />

* **Sample Call:**
curl --location --request POST 'localhost:4000/cart' \
--header 'Content-Type: application/json' \
--data-raw '{"album": "Album 1"}'

* **Notes:**
  <_This endpoint adds an item to the cart table._> 


### Remove cart item

* **URL: `/cart`**

  <_Add to cart_>

* **Method:**
  `DELETE`

* **Data Params for an item delete**
```json
{"id": 2}
```

* **Success Response:**
  * **Code:** 200 <br />
  * **Content-type:** application/json <br />
    **Body:** 
```json
{
    "status": 200,
    "message": "Successfully removed item from cart",
    "data": {
        "fieldCount": 0,
        "affectedRows": 1,
        "insertId": 0,
        "serverStatus": 2,
        "warningCount": 0,
        "message": "",
        "protocol41": true,
        "changedRows": 0
    }
}
```
* **Error Response:**
  * **Code:** 404 NOT FOUND <br />

* **Error Response:**
  * **Code:** 400 Bad Reqeust  <br />
  * **Content-type:** application/json <br />
    **Body:** 
```json
{
    "status": 400,
    "message": "Remove from cart validation failed",
    "error": [
        {
            "value": "fjf",
            "msg": "cart id fjf does not exist",
            "param": "id",
            "location": "body"
        }
    ]
}
```

* **Sample Call:**
curl --location --request DELETE 'localhost:4000/cart' \
--header 'Content-Type: application/json' \
--data-raw '{"id": "3"}'

* **Notes:**
  <_This endpoint removes an item from the cart table._> 