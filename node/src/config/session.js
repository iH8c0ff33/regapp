// 'express-session' config file
module.exports = function (sessionStore) {
    var sessionConfig = {
        secret: 'thatShouldBeSecret',
        cookie: {
            secure: true,
            maxAge: 1000 * 30 // set to 30s for development
        },
        resave: false,
        saveUninitialized: true,
        store: sessionStore,
        proxy: true
    };
    return sessionConfig;
};
