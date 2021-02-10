<?php
    require_once 'config.php';
    
    if (isset($_POST['action']) && $_POST['action'] == 'show_admin_order'){
        $sql_pro = "SELECT *, SUM(`product`.`quantity`)-`product`.`quantity` AS qauntity_product  
        FROM `orders` 
        JOIN `users` ON `orders`.`user_id` = `users`.`user_id` 
        JOIN `order_details` ON `orders`.`order_id` = `order_details`.`order_id` 
        JOIN `product` ON `order_details`.`product_id` = `product`.`product_id` 
        WHERE `stataus`= '1' AND `tracking` = ''  
        GROUP BY `orders`.`order_id` 
        ORDER BY `orders`.`order_id` DESC LIMIT 10";
        // echo $sql_pro;
        $rs = getpdo($conn,$sql_pro);

        if(gettype($rs) == 'array'){

            $sql = "SELECT * FROM `product_image`  WHERE `fk_product_id` in (SELECT `product_id` FROM `product` JOIN `racket_detail` ON `product`.`product_id` = `racket_detail`.`fk_product_id`)";
            $rs2 = getpdo($conn,$sql);

            $res = array("code" => 200, "result" => array("product" => $rs,"product_images" => $rs2));
        	echo json_encode($res);
            return ;
        }
    }else if (isset($_POST['action']) && $_POST['action'] == 'total_admin_order'){
        $sql_pro = "SELECT *, SUM(`product`.`quantity`) AS qauntity_product  
        FROM `orders` 
        JOIN `users` ON `orders`.`user_id` = `users`.`user_id` 
        JOIN `order_details` ON `orders`.`order_id` = `order_details`.`order_id` 
        JOIN `product` ON `order_details`.`product_id` = `product`.`product_id` 
        GROUP BY `orders`.`order_id` 
        ORDER BY `orders`.`order_id` DESC";
        $rs = getpdo($conn,$sql_pro);
// echo $sql_pro;
        if(gettype($rs) == 'array'){

            $sql = "SELECT * FROM `product_image`  WHERE `fk_product_id` in (SELECT `product_id` FROM `product` JOIN `racket_detail` ON `product`.`product_id` = `racket_detail`.`fk_product_id`)";
            $rs2 = getpdo($conn,$sql);

            $res = array("code" => 200, "result" => array("product" => $rs,"product_images" => $rs2));
        	echo json_encode($res);
            return ;
        }
    } else if (isset($_POST['action']) && $_POST['action'] == 'show_stock_admin_order'){
        $sql_pro = "SELECT *, SUM(`product`.`quantity`) AS qauntity_product 
        FROM `product` 
        GROUP BY `product_id` 
        ORDER BY `product_id`DESC ";
        $rs = getpdo($conn,$sql_pro);
// echo $sql_pro;
        if(gettype($rs) == 'array'){

            $sql = "SELECT * FROM `product_image`  WHERE `fk_product_id` in (SELECT `product_id` FROM `product` JOIN `racket_detail` ON `product`.`product_id` = `racket_detail`.`fk_product_id`)";
            $rs2 = getpdo($conn,$sql);

            $res = array("code" => 200, "result" => array("product" => $rs,"product_images" => $rs2));
        	echo json_encode($res);
            return ;
        }
    }else if (isset($_POST['action']) && $_POST['action'] == 'create_stock') {

        $sql = "UPDATE `product` SET `quantity`= '".$_POST['qauntity']."' WHERE `product_id` = '".$_POST['product_id']."'";
        // echo $sql;
        $rs = getpdo($conn, $sql);
    
        if (isset($rs)) {
            $res = array("code" => 200, "result" => $rs, "sql" => $sql);
            echo json_encode($res);
            return;
        }
    }else if (isset($_POST['action']) && $_POST['action'] == 'count_order') {

        $sql = "SELECT COUNT(`order_id`) AS total_order FROM `orders`";
        // echo $sql;
        $rs = getpdo($conn, $sql);
    
        if (isset($rs)) {
            $res = array("code" => 200, "result" => $rs, "sql" => $sql);
            echo json_encode($res);
            return;
        }
    }else if (isset($_POST['action']) && $_POST['action'] == 'count_member') {

        $sql = "SELECT COUNT(`user_id`) AS total_member FROM `users`";
        // echo $sql;
        $rs = getpdo($conn, $sql);
    
        if (isset($rs)) {
            $res = array("code" => 200, "result" => $rs, "sql" => $sql);
            echo json_encode($res);
            return;
        }
    }else if (isset($_POST['action']) && $_POST['action'] == 'total_show_member'){
        $sql_pro = "SELECT * FROM `users` ORDER BY `user_id` DESC";
        $rs = getpdo($conn,$sql_pro);
        // echo $sql_pro;
        
        $res = array("code" => 200, "result" => $rs);
        echo json_encode($res);
        return ;
       
    }else if (isset($_POST['action']) && $_POST['action'] == 'getmember') {

        $sql = "SELECT * FROM `users` WHERE `user_id` =  '" . $_POST['user_id'] . "' LIMIT 1 ";
        // echo $sql;
        $rs = getpdo($conn, $sql);
    
        if(isset($rs)){
            if (count($rs) > 0) {
                $res = array("code" => 200, "result" => $rs[0]);
                echo json_encode($res);
                return;
            }
        }       
    }else if (isset($_POST['action']) && $_POST['action'] == 'updatemember') {

        $sql = "UPDATE `users` SET `username`= '" . $_POST['username'] . "',`name`='" . $_POST['name'] . "',`surname`='" . $_POST['surname'] . "',`email`='" . $_POST['email'] . "'
         WHERE  `user_id` = '" . $_POST['user_id'] . "'";
        // echo $sql;
        $rs = getpdo($conn, $sql);
    
        if(isset($rs)){
            
                $res = array("code" => 200, "result" => $rs[0]);
                echo json_encode($res);
                return;
            
        }       
    }
    else if (isset($_POST['action']) && $_POST['action'] == 'show_pop_product') {

        $sql = "SELECT *,COUNT(`order_details`.`product_id`) AS pop_product , `product`.`product_name` AS pro_pop
        FROM `order_details` 
        JOIN `product` on `product`.product_id = `order_details`.`product_id` 
        GROUP BY `order_details`.`product_id` 
        ORDER BY pop_product DESC limit 3";
        // echo $sql;
        $rs = getpdo($conn, $sql);
        if(isset($rs)){
            
                $res = array("code" => 200, "result" => $rs);
                echo json_encode($res);
                return;
            
        }       
    }


    $result = array("message" => "Error someting");
    $res = array("code" => 401, "result" => $result);
    echo json_encode($res);
?>