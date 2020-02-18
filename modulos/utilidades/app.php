<?php

class App
{
	private $response='';

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
		$body = array(
			'code'=>$code,
			'response'=>$response,
		);
		$this->response=json_encode($body);
	}
	function run()
	{
		echo($this->response);
		if (isset($this->connection))
			$this->connection->close();
		exit();
	}

}

?>