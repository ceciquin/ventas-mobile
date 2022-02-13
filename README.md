## Tabla de contenidos
* [Informacion General](#nformacion-general)
* [Technologies](#tecnologias)
* [Setup](#setup)

## Informacion General
- Final TP - TP2 
- Nombre completo de lxs colaboradores : Cecilia Maria Quintana Amarilla - Federico Sassy - Nicolas Sanchez
- Navegadores : Chrome, Edge
- SO : Windows 10 o macOS ( si precisas correr la app en Mac es probable que necesites configurar Docker)
- Librerias : modulos de node ( mssql, express, entre otros)
- codigo fuente y sus Archivos y carpetas principales: carpeta "clients" (configuracion de la base de datos, por default el puerto es 1433. Para poder levantar la base de datos es posible que sea necesario habilitar el TCP en la computadora), carpeta "DB_vantasMobile ( Carpeta que contiene el esquema de la base de datos y los archivos .csv que contienen los datos), "node_modules" folder ( contiene los modulos de node que precisamos para la app), carpeta "public" (contiene el archivo .css que usamos para dar estilo a la pagina web), Archivo "server.js" ( es la puerta de entrada a nuestra aplicacion, desde aca levantamos el servidor para que se pueda desplegar en nuestro browser)
- Descripcion del projecto : “ventas mobile app” es una aplicación diseñada para vendedores que se encuentran realizando pedidos en la calle. Se espera que sea una herramienta esencial en el día a día para poder concretar pedidos y ventas teniendo a mano toda la información necesaria.


## Tecnologias
Este projecto fue creado usando las siguientes tecnologias:

* node.js v16.13.0
* CSS
* MSSQL
* javascript
	
## Setup
Para correr de manera local esta aplicacion es necesario bajarse **node** y correr los siguientes comandos:
```
$ npm install
$ npm start

```
