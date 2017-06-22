<?php 
	header("Content-Type: text/html;charset=utf-8");
	require_once("coneccion.php");//clase conexion
	require_once("usuarios.php");//clase verusuarios

	$objusuario = new verusuario();
	$objusuario->loguear();//nos dira si el usuario esta registrado
	/*$prueba = array();
	$prueba[0] = $_POST['passwd'];
	echo $prueba[0];*/
 ?>