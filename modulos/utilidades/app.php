<?php

class App
{
	private $response='';
	private $error=404;

	function start($request,$post,$params,$instance)
	{
		$this->request=$request;
		$this->post=$post;
		$this->params=$params;
		$this->instance=$instance;
	}
	function connect($connect)
	{
		$this->connection=$connect;
	}
	function setResponse($code,$response)
	{
		$json = array (
			'response' => $response,
		);
		$encoded = json_encode($json);
		$this->response=$encoded;
		$this->error=$code;
	}
	function run()
	{
		header('Content-type:application/json;charset=utf-8',true,$this->error);
		echo($this->response);
		if (isset($this->connection))
			$this->connection->close();
		exit();
	}

}

?>