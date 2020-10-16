<?php
    require_once 'config.php';


    if(isset($_POST['action']) && $_POST['action'] == 'create_theme'){
    	
        $sql = "INSERT INTO `theme`(`content`, `title`, `category`, `fk_user_id`) VALUES ('".$_POST['summernote']."','".$_POST['header']."','".$_POST['category']."','".$_POST['user_id']."')";
        $rs = getpdo($conn,$sql);
        if(isset($rs) && count($rs) > 0){
        	$res = array("code" => 200, "result" => $rs[0]);
        	echo json_encode($res);
            return ;
        }
    }
?>