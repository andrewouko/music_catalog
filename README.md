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

*Located in the root of the project*
