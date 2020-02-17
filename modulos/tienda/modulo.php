<?php
	echo('<br>Accediste a la tienda<br>');
	echo('Esta sucursal es la numero '.array_shift($request));
	echo('<br>La variable get "pito" tiene el valor "'.$_GET['pito'].'"');
?>