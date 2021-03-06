const { logger } = require('./logger')
class ErrorHandler extends Error {
    constructor(statusCode, message, payload) {
        super();
        this.statusCode = statusCode;
        this.message = message;
        this.payload = payload
    }
}
const logError = (err) => {
    logger.error('Error: ' + JSON.stringify({
        code: err.code,
        statusCode: err.statusCode,
        message: err.message,
        stack: err.stack,
        err: err.payload
    }))
}
const handleError = (err, res, code) => {
    const { statusCode, message } = err;
    // console.log('Status', res.statusCode)
    logError(err)
    if(err.payload && err.payload.sql) err.payload = {
        errno: err.payload.errno,
        message: 'Sql error logged'
    }
    res.status(err.statusCode || 500).send({
        status: err.statusCode || 500,
        message: err.message,
        error: err.payload || null
    })
  };
module.exports = {
    ErrorHandler,
    handleError,
    logError
}