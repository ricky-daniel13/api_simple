<?php
	/*echo('<br>Accediste a la tienda<br>');
	echo('Esta sucursal es la numero '.array_shift($request));
	echo('<br>La variable get "pito" tiene el valor "'.$_GET['pito'].'"');*/
class productos extends Controller {
    
    public function test() {
    $producto1 = array(
        'nombre'=>'Producto 1',
        'cantidad'=>'420',
        'imagen'=>'https://i.picsum.photos/id/119/320/240.jpg'
    );
    $producto2 = array(
        'nombre'=>'Producto 2',
        'cantidad'=>'420',
        'imagen'=>'https://i.picsum.photos/id/145/320/240.jpg'
    );
    $producto3 = array(
        'nombre'=>'Producto 3',
        'cantidad'=>'420',
        'imagen'=>'https://i.picsum.photos/id/2/320/240.jpg'
    );


    $productos = array(
        $producto1,$producto2,$producto3
    );

    $this->app->setResponse(200,$productos);
	  }	
	}
?>