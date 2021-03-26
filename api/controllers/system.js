exports.Ping = (req, res) => {
    const client_ip = req.headers['x-forwarded-for'] || req.connection.remoteAddress;
    return res.status(200).type('json').json({
        ip: client_ip, 
        health: 'Ok', 
        env: {
            port: process.env.PORT ? 'Set' : 'Not Set',
            app_name: process.env.APP_NAME ? 'Set' : 'Not Set',
            HOST: process.env.HOST ? 'Set' : 'Not Set',
            USER: process.env.USER ? 'Set' : 'Not Set',
            PASSWORD: process.env.PASSWORD ? 'Set' : 'Not Set',
            DB: process.env.DB ? 'Set' : 'Not Set'
        }
    });
}
exports.Health = (req, res, next) => {
    return res.status(200).type('html').send('Ok')
}