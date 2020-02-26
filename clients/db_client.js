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
    return connection.query(query);
}

function getProducts() {
    return executeQuery('select p.Nombre_Producto, p.id_Producto, p.Precio_Producto, s.cantidadDisponible_Producto from Producto as p join Stock as s on p.id_Producto = s.id_Producto')
        .then(function (rs) {
            return _.map(rs.recordset, function (register) {
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
}

function newOrder(params) {
    return executeQuery('select nro_Pedido from Pedido')
                .then(function (rs) {
                    let orderId = Number(rs.recordset[(rs.recordset.length - 1)].nro_Pedido);

                    let orderValues = [params.client, params.seller, params.products[0].id];
                    executeQuery('insert into Pedido(nro_Cliente, nro_Vendedor, id_Producto) values(' + orderValues.join(',') + ')');

                    params.products.forEach(function (p) {
                        let valuesProducts = [(p.id.toString() + orderId.toString()), p.id, orderId, p.qty];
                        executeQuery('insert into ItemPedido (id_itemProducto, id_Producto, id_Pedido, cantidad) values (' + valuesProducts.join(',') + ')')
                    });
                })
                .then(function () { return { status: 200, message: "New order saved successfuly" } });
}

function getStock() {
    return executeQuery('select p.Nombre_Producto, s.cantidadDisponible_Producto from Producto as p join Stock as s on p.id_Producto = s.id_Producto')
        .then((rs) => {
            return _.map(rs.recordset, function (register) {
                let product = {};

                product.name = register.Nombre_Producto;
                product.stock = Number(register.cantidadDisponible_Producto);

                return product;
            });
        });
}

module.exports = {
    getProducts: getProducts,
    getStock: getStock,
    newOrder: newOrder
}