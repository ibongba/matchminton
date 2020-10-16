<?php
    require_once 'config.php';


    if(isset($_POST['action']) && $_POST['action'] == 'create_theme'){
    	
        $sql = "INSERT INTO `theme`(`content`, `title`, `category`, `fk_user_id`) VALUES ('".$_POST['summernote']."','".$_POST['header']."','".$_POST['category']."','".$_POST['user_id']."')";
        $rs = getpdo($conn,$sql);
        if(isset($rs)){
        	$res = array("code" => 200, "result" => $rs[0]);
        	echo json_encode($res);
            return ;
        }
    }else if (isset($_POST['action']) && $_POST['action'] == 'get_theme_with_id'){
        $sql = "SELECT `theme_id`, `content`, `title`, `category`, `status`, `create_at`, `update_at`, `fk_user_id` FROM `theme` WHERE  `fk_user_id` = '".$_POST['user_id']."'";
        $rs = getpdo($conn,$sql);
        if(isset($rs)){
        	$res = array("code" => 200, "result" => $rs);
        	echo json_encode($res);
            return ;
        }
    }else if (isset($_POST['action']) && $_POST['action'] == 'get_theme'){
        $sql = "SELECT `theme_id`, `content`, `title`, `category`, `status`, `create_at`, `update_at`, `fk_user_id` FROM `theme`";
        if (isset($_POST['order_by'])) {
           $sql .= " ORDER BY ".$_POST['order_by']." DESC";
        }
        if (isset($_POST['theme_id'])) {
            $sql .= " WHERE `theme_id` ".$_POST['theme_id']." ";
         }
        $rs = getpdo($conn,$sql);
        if(isset($rs)){
        	$res = array("code" => 200, "result" => $rs);
        	echo json_encode($res);
            return ;
        }
    }else if (isset($_POST['action']) && $_POST['action'] == 'edit_theme'){
        $sql = "UPDATE `theme` SET `content`= '".$_POST['summernote']."',`title`='".$_POST['header']."'";
        $rs = getpdo($conn,$sql);
        if(isset($rs)){
        	$res = array("code" => 200, "result" => $rs[0]);
        	echo json_encode($res);
            return ;
        }
    }else if (isset($_POST['action']) && $_POST['action'] == 'get_edit_theme'){
        $sql = "SELECT `theme_id`, `content`, `title`, `category`, `status`, `create_at`, `update_at`, `fk_user_id` FROM `theme` WHERE `theme_id` = '".$_POST['theme_id']."' LIMIT 1 ";
        // echo $sql;
        $rs = getpdo($conn,$sql);
        if(isset($rs)){
            if (count($rs) > 0) {
                $res = array("code" => 200, "result" => $rs[0]);
                echo json_encode($res);
                return;
            }
        }
    }

    $result = array("message" => "Error someting");
    $res = array("code" => 401, "result" => $result);
    echo json_encode($res);
?>