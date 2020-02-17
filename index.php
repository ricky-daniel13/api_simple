<?php

/* Variables Globales */
$instancia = '';
$request = '';
$token = '';


//Preparacion de Url
$request_uri = @parse_url($_SERVER['REQUEST_URI']);
$path = $request_uri['path'];
$request = explode('/', trim($path, '/'));

$instancia = array_shift($request);

//Conexion
include('./modulos/conexion/conexion.php');





echo('<br>Estas en la instancia '.$instancia);

if (count($request)==0)
{
	echo('<br>No llamaste a ninguna funcion en la API');
	exit();
}

$url = './modulos/'.array_shift($request).'/modulo.php';
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