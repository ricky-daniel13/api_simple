<?php

class Errores
{
	function throwError($app,$code,$message){
	$app->setResponse($code,$message);
	$app->run();
	}
}
?>