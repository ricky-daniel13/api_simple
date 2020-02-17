 <?php
$servername = "localhost";
$username = "root";
$password = "";
$gestor = "gestor";
$database = '';
$connected = 1;

$conn = new mysqli($servername, $username, $password, $gestor);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
echo "Conectado al gestor con exito";

$sql = "SELECT * FROM instancias WHERE chNombre = '".$instancia."';";
$result = $conn->query($sql);

if (!$result) {
    echo('Invalid query: ' . $conn->error);
    exit();
}
if ($result->num_rows > 0) {
	$result = $result->fetch_assoc();
	$database = $result['chDatabase'];
	$conn = new mysqli($servername, $username, $password, $database);
	
	if ($conn->connect_error) {
		die("Error al conectar con la instancia: " . $conn->connect_error);
		exit();
	}
	else 	{
		echo('Conexion exitosa con la instancia');
	}
}
else
{
	echo('<br>No existe la instancia '.$instancia.' en nuestro sistema');
	exit();
}


?> 