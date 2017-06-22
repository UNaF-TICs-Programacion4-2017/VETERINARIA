<?php
session_start();

class crud{

    private $db;
	
     public function __construct(PDO $db) 
    {
        $this->db = $db;
    }
    
    public function getRows($table,$conditions = array()){
        $sql = 'SELECT ';
        $sql .= array_key_exists("select",$conditions)?$conditions['select']:'*';
        $sql .= ' FROM '.$table;
        
		if(array_key_exists("where",$conditions)){
            $sql .= ' WHERE ';
            $i = 0;
			
            foreach($conditions['where'] as $key => $value){
                $pre = ($i > 0)?' AND ':'';
                $sql .= $pre.$key." = '".$value."'";
                $i++;
            }
        }
        
        if(array_key_exists("order_by",$conditions)){
            $sql .= ' ORDER BY '.$conditions['order_by']; 
        }
        
        if(array_key_exists("start",$conditions) && array_key_exists("limit",$conditions)){
            $sql .= ' LIMIT '.$conditions['start'].','.$conditions['limit']; 
        }elseif(!array_key_exists("start",$conditions) && array_key_exists("limit",$conditions)){
            $sql .= ' LIMIT '.$conditions['limit']; 
        }
        
		$query = $this->db->prepare($sql);
        $query->execute();
        
        if(array_key_exists("return_type",$conditions) && $conditions['return_type'] != 'all'){
            switch($conditions['return_type']){
                case 'count':
                    $data = $query->rowCount();
                    break;
                case 'single':
                    $data = $query->fetch(PDO::FETCH_ASSOC);
                    break;
                default:
                    $data = '';
            }
        }else{
            if($query->rowCount() > 0){
                $data = $query->fetchAll();
            }
        }
        return !empty($data)?$data:false;
    }
    
	
	  public function getRowsVista($sql,$conditions = array()){
	  	  $query = $this->db->prepare($sql);
          $query->execute();
		  
		   if(array_key_exists("return_type",$conditions) && $conditions['return_type'] != 'all'){
           	  switch($conditions['return_type']){
                case 'count':
                    $data = $query->rowCount();
                    break;
                case 'single':
                    $data = $query->fetch(PDO::FETCH_ASSOC);
                    break;
                default:
                    $data = '';
              }
			}else{
				if($query->rowCount() > 0){
					$data = $query->fetchAll();
				}
			}
			return !empty($data)?$data:false;
	  
	  }
	
	public function insert($table,$data){
        if(!empty($data) && is_array($data)){
            $columns = '';
            $values  = '';
            $i = 0;
            
			$columnString = implode(',', array_keys($data));
            $valueString = ":".implode(',:', array_keys($data));
            $sql = "INSERT INTO ".$table." (".$columnString.") VALUES (".$valueString.")";
            
			$query = $this->db->prepare($sql);
            foreach($data as $key=>$val){
                 $query->bindValue(":".$key, $val);
            }
            $insert = $query->execute();
            return $insert?$this->db->lastInsertId():false;
        }else{
            return false;
        }
    }
	
	public function guardarLog($sql,$accion,$modulo){
		
            $columns = '';
            $values  = '';
            $i = 0;
            
			$sql = "INSERT INTO confi_13_log_usuario ( 
					fk_confi03,
					confi03_modulo, 
					confi03_fecha, 
					confi03_ip, 
					confi03_nombre_maquina, 
					confi03_operacion, 
					confi03_sql
					) 
					º  VALUES (".$_SESSION["id_user"].",
					'$modulo',
					NOW(),
					'".$this->getIP()."',
					'".$this->getHostName()."',
					'".$accion."',
					'".$sql."')";
			
			$query = $this->db->prepare($sql);
            $insert = $query->execute();
            return $insert?$this->db->lastInsertId():false;
        
    }
    
    public function update($table,$data,$conditions){
        if(!empty($data) && is_array($data)){
            $colvalSet = '';
            $whereSql = '';
            $i = 0;
            
			foreach($data as $key=>$val){
                $pre = ($i > 0)?', ':'';
                $colvalSet .= $pre.$key."='".$val."'";
                $i++;
            }
            if(!empty($conditions)&& is_array($conditions)){
                $whereSql .= ' WHERE ';
                $i = 0;
                foreach($conditions as $key => $value){
                    $pre = ($i > 0)?' AND ':'';
                    $whereSql .= $pre.$key." = '".$value."'";
                    $i++;
                }
            }
            $sql = "UPDATE ".$table." SET ".$colvalSet.$whereSql;
            $query = $this->db->prepare($sql);
            $update = $query->execute();
			
            return $update?$query->rowCount():false;
        }else{
            return false;
        }
    }
    
    public function delete($table,$conditions){
        $whereSql = '';
        if(!empty($conditions)&& is_array($conditions)){
            $whereSql .= ' WHERE ';
            $i = 0;
            foreach($conditions as $key => $value){
                $pre = ($i > 0)?' AND ':'';
                $whereSql .= $pre.$key." = '".$value."'";
                $i++;
            }
        }
        $sql = "DELETE FROM ".$table.$whereSql;
        $delete = $this->db->exec($sql);
        return $delete?$delete:false;
    }
	
	public function getIP()
	{
			  if( isset( $_SERVER ['HTTP_X_FORWARDED_FOR'] ) ){

				  $ip = $_SERVER ['HTTP_X_FORWARDED_FOR'];
			
				  }elseif( isset( $_SERVER ['HTTP_VIA'] ) ){
			
				  $ip = $_SERVER ['HTTP_VIA'];
			
				  }elseif( isset( $_SERVER ['REMOTE_ADDR'] ) ){
			
				  $ip = $_SERVER ['REMOTE_ADDR'];
			
				  }else{
			
				  $ip = "Anonima" ;
			
				  }
				  return $ip;
	}
	
	public function getHostName(){
		return php_uname('n');
	}
}

?>