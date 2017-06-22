<?php 
/*SELECT persona.id_persona, persona.nombre, telefonos.numero_telefono FROM telefonos //rela
INNER JOIN persona on persona.id_persona = telefonos.rela_persona
	require_once("coneccion.php");

	$objconec = new database;
	$numero = 2;

	$consulta= $objconec->query("SELECT persona.id_persona, persona.nombre, telefonos.numero_telefono FROM telefonos
INNER JOIN persona on persona.id_persona = telefonos.rela_persona where persona.id_persona = $numero");
	foreach ($consulta as $key => $value) {
		//echo $value['nombre'];
		
	}*/
	$error = isset($_GET['error']) ? $_GET['error'] : null;
?>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
	<title>Inicie Sesion</title>
	<link href="css.css" rel="stylesheet" type="text/css" > 
</head>
<body>

	<form name="iniciarsesion" action="sesiones.php" method="POST">
		<?php 
			if($error == 1){
				echo "USUARIO Y/O CONTRASEÑA ERRONEOS"."<br />"."<br />";
			} 
			if($error == 2){
				echo "DEBE INICIAR SESION PARA ACCEDER AL SITIO"."<br />"."<br />";
			}
			?>
		Usuario:<br/>
		<input type="text" name="usuario" id="usuario"><br />
		Password:<br/> 
		<input type="password" name="passwd" id="passwd"/><br /><br />
		<input type="submit" name="ACCERDER" id="botonAcceder" value='Acceder' 
		/>
</form>
<script type="text/javascript">
	

</script>
</body>
</html>