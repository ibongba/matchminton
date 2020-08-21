<?php
	date_default_timezone_set("Asia/Bangkok");
    header('Content-type: text/html; charset=utf-8');
    require_once 'PDO.php';

    $db_host = 'localhost:8889';
    $db_name = 'matchminton';
    $db_user = 'root';
    $db_pass = '1';

    $conn = new PDO("mysql:host=$db_host; dbname=$db_name", $db_user, $db_pass);
    $conn->exec("SET CHARACTER SET utf8");

    if(isset($_POST['action']) && $_POST['action'] == 'login'){
        $sql = "SELECT `user_id`, `name`, `surname` ,`email` ,`phone` FROM `users` WHERE `username` = '".$_POST['username']."' and `password` = '".md5($_POST['password'])."' and status=1";
        $rs = getpdo($conn,$sql);
        if(isset($rs) && count($rs) > 0){
        	$res = array("code" => 200, "result" => $rs[0]);
        	echo json_encode($res);
            return ;
        }
    }else if(isset($_POST['action']) && $_POST['action'] == 'register'){
    	if(!isset($_POST['username']) && !isset($_POST['password'])){
    		$result = array("message" => "Error parameter");
		    $res = array("code" => 401, "result" => $result);
		    echo json_encode($res);
            return ;
    	}

        $sql = "INSERT INTO `users`(`username`, `password`, `name`, `surname`, `email`) VALUES ('".$_POST['username']."','".md5($_POST['password'])."','".$_POST['name']."','".$_POST['surname']."','".$_POST['email']."')";
        $rs = getpdo($conn,$sql);
        if($rs){
            $res = array("code" => 200, "result" => $rs);
	        echo json_encode($res);
            return ;
			
        }
    }else if(isset($_POST['action']) && $_POST['action'] == 'edit'){
        $sql = "UPDATE `users` SET `name`='".$_POST['name']."',`surname`='".$_POST['surname']."',`phone`='".$_POST['phone']."',`email`='".$_POST['email']."' WHERE `user_id` = '".$_POST['user_id']."'";
        $rs = getpdo($conn,$sql);
        if($rs){
            $sql = "SELECT `user_id`, `name`, `surname` ,`email` ,`phone` FROM `users` WHERE `user_id` = '".$_POST['user_id']."' and status=1";
            $rs = getpdo($conn,$sql);

            $res = array("code" => 200, "result" => $rs[0]);
            echo json_encode($res);
            return ;
            
        }
    }

    $result = array("message" => "Error someting");
    $res = array("code" => 401, "result" => $result);
    echo json_encode($res);
?>