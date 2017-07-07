/**
 * Created by mothw on 6/28/2017.
 */

// Dependencies
// =============================================================
var express = require("express");
var handlebars = require("express-handlebars");
var mysql = require("mysql")
var bodyParser = require("body-parser");
var path = require("path");
var fs = require("fs");



// Sets up the Express App
// =============================================================
var app = express();
var PORT = process.env.PORT || 3000;
app.use(express.static("public"));

// Sets up the Express app to handle data parsing
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.text());
app.use(bodyParser.json({ type: "application/vnd.api+json" }));


var mysql = require("mysql");

var connection = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "template_db"
});

connection.connect(function(err) {
    if (err) {
        console.error("error connecting: " + err.stack);
        return;
    }
    console.log("connected as id " + connection.threadId);
});

//module.exports = connection;
