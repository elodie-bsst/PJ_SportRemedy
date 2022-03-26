const express = require('express');
const dotenv = require('dotenv');
const app = express();
const WEB_PORT = 7002

dotenv.config();

app.listen(WEB_PORT, () => {
    console.log(`Our app listening at http://localhost:${WEB_PORT}/information`);
});

const session = require("express-session");
app.use(session({
    secret: "secretStringzsdvdgdgfdsbfs",
    saveUninitialized: true,
    cookie: { maxAge: 1000 * 60 * 60 * 24 }, // 1 day in msec
    resave: false
}));


app.listen(process.env.WEB_PORT,
    function() { console.log("Listening on "+process.env.WEB_PORT); }
);
app.get('/', (req, res) => {
    res.send('Hello, nodejs website...');
});

app.set("view engine", "ejs");
app.set("views", "views");


const bodyParser = require("body-parser");
app.use(bodyParser.json(), bodyParser.urlencoded({ extended: true }));

app.use("/menu", require("./controllers/menu.route"));
app.use("/frontpage", require("./controllers/frontpage.route"));
app.use("/information", require("./controllers/information.route"));




app.use("/static", express.static(__dirname + '/static'));