var express = require('express'); // indicate module requere for express
var chalk = require('chalk'); // give color to certain message at cmd
var debug = require('debug')('server'); // give the option to debug only in debug mode
var path = require('path'); // to get the "join" method, to join strings
var morgan = require('morgan');//information about web traffic
var bodyParser = require('body-parser');

var server = express(); //instance of express

server.use(morgan('tiny')); //call Morgan utility

server.use('/css',express.static(path.join(__dirname,'/public/')));//reference to static components in "public" folder
server.use('/css',express.static(path.join(__dirname,'/node_modules/bootstrap/dist/css/'))); //reference to static files downloaded as node modules.-CSS
server.use('/js',express.static(path.join(__dirname,'/node_modules/bootstrap/dist/js/')));//Reference for js files - javascript
server.use('/js',express.static(path.join(__dirname,'/node_modules/jquery/')));//reference for jquery functionality

server.get('/',function(req,res){
    res.sendfile(path.join(__dirname,'/views/index.html'));// current location of the file
});

server.listen(3000, function(){
    debug(`listening on port ${chalk.green('3000')}`);
});