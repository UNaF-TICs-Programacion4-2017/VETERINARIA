<?php 
	
	class verusuario{

		public $objdb;
		public $objse;
		public $result;
		public $filas;
		public $usuariopc;

		public function __construct(){

			$this->objdb = new database();//instanciamos la clase conexion

		}

		public function loguear(){

			$stmt = $this->objdb->prepare("SELECT * FROM usuarios INNER JOIN persona ON usuarios.rela_persona = persona.id_persona INNER JOIN tipo_usuario ON usuarios.rela_tipousuario = tipo_usuario.id_tipousuario WHERE usuarios.usuario = :us AND usuarios.pass = :pass");//preparamos la sentencia sql
			
			$stmt->bindParam(':us',$_POST["usuario"]);
			$stmt->bindParam(':pass',$_POST["passwd"]);//pasamos los parametros
			$stmt->execute(/*array(':us',$_POST["usuario"],':pass',$_POST["passwd"])*/);//ejecutamos la sentencia

			$this->result = $stmt->fetchAll();//extraemos los datos
			print_r($this->result);

			if ($this->result) {//comparamos los resultados
				echo 'datos encontrados con exito';
			}
			else{
				header('location: index.php?error=2');//si no hay datos encontrados nos lo dira
			}

			switch ($this->result[0]['tipo_usuario']) {
				case 'estandar':
					header('location: estandarindex.php');//nos lleva a pagina de usuarios comunes
					break;
				
				case 'administrador':
					header('location: adminindex.php');//nos lleva a la pagina de usuarios administradores
					break;
			}
		}
	}
 ?>