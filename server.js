const express = require('express'); // indicate module requere for express
const chalk = require('chalk'); // give color to certain message at cmd
const debug = require('debug')('server'); // give the option to debug only in debug mode
const path = require('path'); // to get the "join" method, to join strings
const morgan = require('morgan');//information about web traffic
//const _ = require('lodash');

const server = express(); //instance of express

server.use(morgan('tiny')); //call Morgan utility

server.use('/css', express.static(path.join(__dirname, '/public/')));//reference to static components in "public" folder
server.use('/css', express.static(path.join(__dirname, '/node_modules/bootstrap/dist/css/'))); //reference to static files downloaded as node modules.-CSS
server.use('/js', express.static(path.join(__dirname, '/node_modules/bootstrap/dist/js/')));//Reference for js files - javascript
server.use('/js', express.static(path.join(__dirname, '/node_modules/jquery/')));//reference for jquery functionality
server.set('views', './src/view'); // dir for the engine views
server.set('view engine', 'ejs');


server.get('/', (req, res) => { //get Method route
    res.render('index', {title: 'Ventas Mobile'});
});

// ###############    ORDERS    ###############

server.get('/orders', (req, res) => {
    //let products = db_client.products.getAll();
    let mock = [
        {
            id: 1,
            name: "yerba",
            price: 200
        },
        {
            id: 2,
            name: "leche",
            price: 100
        },
        {
            id: 3,
            name: "azucar",
            price: 30
        }
    ];
    res.render('ordersForm', {products: mock});
});

server.post('orders/new_order', (res, req) => {
    let queryString = req.query;

    /*db_client.order.save(queryString, function (err) {
        if (err) res.json({status: 500, message: "There was an error trying to save the order"})
    });*/

    // if everyting ok, then returns to the orders form to create a new one
    //res.render('ordersForm', {products: db_client.products.getAll()});
});

// ###############    ORDERS    ###############

server.listen(3000, () => {
    debug(`listening on port ${chalk.green('3000')}`);
});