const { ErrorHandler, handleError } = require('../error.js')
const { selectSongs, selectArtistByGenre, selectCart, updateCart, deleteFromCart } = require('../models/catalog.js')
const {query} = require('../models/db.js')
const handleQueryErrors = (err, res, msg) => {
    err = new ErrorHandler(400, msg, err)
    handleError(err, res)
}
const handleSuccess = (response, db_result, table, msg) => {
    if(!msg) msg = 'Successful listing of ' + table
    response.status(200).json({
        status: 200,
        message: msg,
        data: db_result
    })
}
exports.listFrom = (table, field = 'name') => (req, res) => {
    query.select(table, (req.params[field]) ? {field: field, value: req.params[field]} : null, (err, result) => {
        if(err) return handleQueryErrors(err, res, 'List of ' + table + ' failed')
        handleSuccess(res, result, table)
    })
}
exports.listSongs = (parameter = 'name', field = 'song.name') => (req, res) => {
    selectSongs((req.params[parameter]) ? {field: field, value: req.params[parameter]} : null, (err, result) => {
        if(err) return handleQueryErrors(err, res, 'List of  song failed')
        handleSuccess(res, result, 'song')
    })
}
exports.listCart = () => (req, res) => {
    selectCart(req.ip, (err, result) => {
        if(err) return handleQueryErrors(err, res, 'List of cart failed')
        handleSuccess(res, result, 'cart')
    })
}
exports.AddToCart = (req, res) => {
    const data = Object.assign(req.body, {client_ip: req.ip})
    query.create('cart', data, (err, result) => {
        if(err) return handleQueryErrors(err, res, 'Add to cart failed')
        handleSuccess(res, result, 'cart', 'Successfully added to cart')
    })
}
exports.filterBy = (table, parameter_name) => (req, res) => {
    let q = '';
    const value = req.params.genre
    if(table === 'artist' && parameter_name === 'genre'){
        selectArtistByGenre(value, (err, result) => {
            if(err) return handleQueryErrors(err, res, 'Artist filter by ' + parameter_name + ' failed')
            handleSuccess(res, result, 'artist')
        })
    }
}
exports.PurchaseCart = (req, res) => {
    updateCart(req.ip, (err, result) => {
        if(err) return handleQueryErrors(err, res, 'Purchase cart failed')
        handleSuccess(res, result, 'cart', 'Successfully purchased cart')
    })
}
exports.removeCartItem = (req, res) => {
    // const data = Object.assign(req.body, {client_ip: req.ip})
    deleteFromCart(req.body, (err, result) => {
        if(err) return handleQueryErrors(err, res, 'Remove item from cart failed')
        handleSuccess(res, result, 'cart', 'Successfully removed item from cart')
    })
}