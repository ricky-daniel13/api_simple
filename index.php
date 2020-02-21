<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

/* Variables Globales */
$instancia = '';
$request = '';


array_shift($request);

//Preparacion de Url
$request_uri = @parse_url($_SERVER['REQUEST_URI']);
$path = $request_uri['path'];
$request = explode('/', trim($path, '/'));

$instance = array_shift($request);
$modulo = array_shift($request);

//Utilidades
include('./modulos/utilidades/conexion.php');
include('./modulos/utilidades/errores.php');
include('./modulos/utilidades/app.php');

//Inicializacion
$app = new App;
$app->start($request, $_POST,$_GET,$instance);
$app->connect((new Conexion)->conectar($app));




//echo('<br>Estas en la instancia '.$instancia);

if (!isset($modulo))
{
	(new Errores)->throwError($app,500,'<br>No llamaste a ninguna funcion en la API');
}

$url = './modulos/'.$modulo.'/modulo.php';

if (!file_exists($url))
	(new Errores)->throwError($app,404,'Modulo inexistente');
echo('<br>La url que te abrira un modulo dinamicamente es<br>'.$url);
include($url);

/*foreach ($selectors as $regex => $funcs) {
    if (preg_match($regex, $path, $args)) {
        $method = $_SERVER['REQUEST_METHOD'];
        if (isset($funcs[$method])) {
            // here the request is handled and the correct method called. 
            echo "calling ".$funcs[$method]." for ".print_r($args);
            $output = $funcs[$method]($args);
            // handling the output...
        }
        break;
     }
}*/
$conn->close();

?>