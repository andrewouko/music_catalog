var express = require('express')
require('dotenv').config()
const cors = require('cors');


const app = express();

app.use(cors())

const router = express.Router();

// parse requests of content-type: application/json
app.use(express.json());

// parse requests of content-type: application/x-www-form-urlencoded
app.use(express.urlencoded({ extended: true }));

// register middleware
const { entryMiddleware, errorHandlingMiddleware, exitMiddleware , } = require('./api/middleware.js');

// entry middleware to log all HTTP Requests
entryMiddleware(app)
// exit middleware to log all HTTP Responses
exitMiddleware(app)

// register routes
var routes = require('./api/routes.js')
routes(app)

// generic error handler
errorHandlingMiddleware(app)

// set port, listen for requests
const port = process.env.PORT || 4000
app.listen(port, () => {
  console.log(process.env.APP_NAME + " is running on port " + port);
})