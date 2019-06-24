const express = require('express'); // indicate module requere for express
const chalk = require('chalk'); // give color to certain message at cmd
const debug = require('debug')('server'); // give the option to debug only in debug mode
const path = require('path'); // to get the "join" method, to join strings
const morgan = require('morgan');//information about web traffic
const bodyParser = require('body-parser');

const server = express(); //instance of express

server.use(morgan('tiny')); //call Morgan utility

server.use('/css',express.static(path.join(__dirname,'/public/')));//reference to static components in "public" folder
server.use('/css',express.static(path.join(__dirname,'/node_modules/bootstrap/dist/css/'))); //reference to static files downloaded as node modules.-CSS
server.use('/js',express.static(path.join(__dirname,'/node_modules/bootstrap/dist/js/')));//Reference for js files - javascript
server.use('/js',express.static(path.join(__dirname,'/node_modules/jquery/')));//reference for jquery functionality
server.set('views', './src/view'); // dir for the engine views
server.set ('view engine', 'ejs');


server.get('/',(req, res) =>{ //get Method route
    res.render('index',{title: 'Ventas Mobile'});
});
    
    

server.listen(3000,() => {
    debug(`listening on port ${chalk.green('3000')}`);
});