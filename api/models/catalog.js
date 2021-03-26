const {connection, query} = require('./db.js')

exports.selectSongs = (data = null, result) => {
    let q = 'select song.name, album.name as album, artist.name as artist, genre.name as genre FROM song INNER JOIN album ON album.name = song.album INNER JOIN artist ON artist.name = album.artist INNER JOIN genre ON genre.name = album.genre'
    if(data !== null) q += ` where ${data.field} = '${data.value}'`;
    query.runQuery(q, result)
};

exports.selectArtistByGenre = (genre, result) => {
    let q = 'SELECT artist.* FROM album INNER JOIN artist ON artist.name = album.artist INNER JOIN genre ON genre.name = album.genre WHERE album.genre = \''+ genre + '\''
    query.runQuery(q, result)
};

exports.selectCart = (client_ip, result) => {
    let q = 'select * FROM cart where isPurchased = 0 AND client_ip = \''+client_ip+'\''
    query.runQuery(q, result)
};

exports.updateCart = (client_ip, result) => {
    let q = 'update cart set isPurchased = 1 where client_ip = \''+client_ip+'\''
    query.runQuery(q, result)
};
exports.deleteFromCart = (data, result) => {
    let q = 'DELETE FROM cart where id = \''+data.id+'\''
    query.runQuery(q, result)
};