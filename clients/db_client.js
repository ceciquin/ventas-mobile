const sql = require('mssql');
const _ = require('lodash');
const config = {
    user: 'sa',
    password: 'ortLocal123',
    server: 'localhost',
    database: 'VentasMobile'
};
const connection = sql.connect(config, function (err) {
    if (err) console.log(err);

    return new sql.Request();
});

function executeQuery(query) {
    // connection.query(query, function (err, rs) {
    //     if (err) console.log(err);

    //     return callback(rs.recordset);
    // });

    // let registers;
    // return connection.query(query).then(rows => {
    //     registers = rows.recordset;
    // })
    // .then( () => {
    //     return callback(registers);
    // });

    return connection.query(query);
}

function getProducts() {
    // let products = executeQuery('select p.Nombre_Producto, p.id_Producto, p.Precio_Producto, s.cantidadDisponible_Producto from Producto as p join Stock as s on p.id_Producto = s.id_Producto',
    //     function (recordset) {
    //         return _.map(recordset, function (register) {
    //             let product = {};

    //             product.id = Number(register.id_Producto);
    //             product.name = register.Nombre_Producto;
    //             product.price = Number(register.Precio_Producto);
    //             product.stock = Number(register.cantidadDisponible_Producto);

    //             return product;
    //         });
    //     });

    // console.log('asd => ', products);

    let promise = executeQuery('select p.Nombre_Producto, p.id_Producto, p.Precio_Producto, s.cantidadDisponible_Producto from Producto as p join Stock as s on p.id_Producto = s.id_Producto');

    return promise.then(function (rs) {
        let recordset = rs.recordset;
        return _.map(recordset, function (register) {
            let product = {};

            product.id = Number(register.id_Producto);
            product.name = register.Nombre_Producto;
            product.price = Number(register.Precio_Producto);
            product.stock = Number(register.cantidadDisponible_Producto);

            return product;
        });
    }).then(function (products) {
        return _.filter(products, function (p) { return p.stock > 0 });
    });

    //let bla = _.filter(products, function (p) { p.stock > 0 });

    //console.log('bla => ', bla)
}

module.exports = {
    getProducts: getProducts
}