 <?php

class Conexion {

	function conectar($app){
		
		$servername = "localhost";
		$username = "root";
		$password = "";
		$gestor = "gestor";
		$database = '';

		$conn = new mysqli($servername, $username, $password, $gestor);

		if ($conn->connect_error) {
		    (new Errores)->throwError($app,500,"Connection failed: " . $conn->connect_error);
		}
		//echo "Conectado al gestor con exito";

		$sql = "SELECT chDatabase FROM instancias WHERE chNombre = '".$app->instance."';";
		$result = $conn->query($sql);

		if ($result->num_rows > 0) {
			$result = $result->fetch_assoc();
			$database = $result['chDatabase'];
			$conn = new mysqli($servername, $username, $password, $database);
			
			if ($conn->connect_error) {
				(new Errores)->throwError($app,500, "Error al conectar con la instancia: " . $conn->connect_error);
			}
			else 	{
				return $conn;
				//echo('Conexion exitosa con la instancia');
			}
		}
		else
		{
			(new Errores)->throwError($app,404, '<br>No existe la instancia '.$app->instance.' en nuestro sistema');
		}
	}

}

?> 