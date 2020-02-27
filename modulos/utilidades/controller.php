<?php

class Controller
{
	function __construct($app)
	{
		$this->app=$app;
		if (isset($this->modelClase))
			$this->model = new $this->modeloClase;
		$this->doFunction();
	}

	public function doFunction()
	{
		if (method_exists($this, $this->app->request[0]))
			call_user_func(array($this, $this->app->request[0]));
		else
			(new Errores)->throwError($this->app,404,"No se encontro esta funcion");
	}
}
?>