'use strict';
var express = require('express');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var session = require('express-session');
var SequelizeStore = require('connect-session-sequelize')(session.Store);
var passport = require('passport');
var app = express();
// Database connection
var Sequelize = require('sequelize');
var db = new Sequelize('postgres://www@database:5432/regapp');
var sessionStore = new SequelizeStore({
    db: db
});
sessionStore.sync();
// Models
db.sync();
// Express configuration
app.use(cookieParser());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: false
}));
app.enable('trust proxy');
// Passport configuration
app.use(session(require(__dirname + '/config/session.js')(sessionStore)));
app.use(passport.initialize());
app.use(passport.session());
app.get('/', function (req, res) {
    res.send('OK');
});
app.listen(3042, '0.0.0.0');
