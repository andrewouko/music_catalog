const {param, validationResult, check, oneOf} = require('express-validator');
const { ErrorHandler } = require('./error');
const {query} = require('../api/models/db.js');
const { selectArtistByGenre, selectSongs } = require('./models/catalog');
const isExists = (table, field, value) => {
    return new Promise((resolve, reject) => {
        query.select(table, {field: field, value: value}, (err, result) => {
            if(err) return reject(new Error('Database error occurred: ' + err.message))
            if(!result.length) return reject(new Error(`${table} ${field} ${value} does not exist`))
            resolve(true)
        })
    })
}
const isSongExists = (field, value) => {
  return new Promise((resolve, reject) => {
      selectSongs({field: field, value: value}, (err, result) => {
          if(err) return reject(new Error('Database error occurred: ' + err.message))
          if(!result.length) return reject(new Error(`song ${field} ${value} does not exist`))
          resolve(true)
      })
  })
}
exports.validateList = (parameter_name, field = null) => {
  if(!field) field = parameter_name
  return [
      param(parameter_name).custom((value, {req}) => {
          let table = null;
          if(req.path.includes('genres')) table = 'genre'
          if(req.path.includes('artists')) table = 'artist'
          if(req.path.includes('albums')) table = 'album'
          if(req.path.includes('songs')) table = 'song'
          if(table === 'song') return isSongExists(field, value)
          return isExists(table, parameter_name, value)
      }),
    (req, res, next) => {
      const errors = validationResult(req);
      if (!errors.isEmpty()) throw new ErrorHandler(400, 'Get list validation failed', errors.array())
      next();
    },
  ]
}
exports.validateAddToCart = [
    oneOf([check('song').exists().custom((value) => {
        return isExists('song', 'name', value)
    }), check('album').exists().custom((value) => {
        return isExists('album', 'name', value)
    })]),
  (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) throw new ErrorHandler(400, 'Add to cart validation failed', errors.array())
    next();
  },
];

exports.validateRemoveItemFromCart = [
  check('id').exists().custom((value) => {
      return isExists('cart', 'id', value)
  }),
(req, res, next) => {
  const errors = validationResult(req);
  if (!errors.isEmpty()) throw new ErrorHandler(400, 'Remove from cart validation failed', errors.array())
  next();
},
];

// const isExistsRunQuery = (q) => {
  // return new Promise((resolve, reject) => {
  //     query.runQuery(q, (err, result) => {
  //         if(err) reject(new Error('Database error occurred'))
  //         if(!result.length) reject(`Query returned an empty result`)
  //         resolve(true)
  //     })
  // })
// }
exports.validateFilter = (table, parameter_name) => [
  param(parameter_name).custom((value, {req}) => {
      if(table === 'artist' && parameter_name === 'genre'){
        return new Promise((resolve, reject) => {
          selectArtistByGenre(value, (err, result) => {
              if(err) reject(new Error('Database error occurred'))
              if(!result.length) reject(`Query returned an empty result`)
              resolve(true)
          })
        })
      }
      return false
  }),
  (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) throw new ErrorHandler(400, 'Get list validation failed', errors.array())
    next();
  },
];