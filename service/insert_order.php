<?php 
  require_once 'config.php';
?>

<?php
  $date = date_create();
  $date_now = date_format($date, 'Y-m-d H:i:s') . "\n";
  $carts = $_POST['cart'];

  $sql_lastid = "SELECT * FROM `orders` ORDER BY `created_at` DESC";
  // echo $sql_lastid;
  $rs = getpdo($conn, $sql_lastid);
  
      if (count($rs) > 0) {
          $lastid = substr($rs[0]['order_id'], -6, 6);
      } else {
          $lastid = 0;
      }

      $lastid = intval($lastid) + 1;
      $nextid = "";
      $nextid .= substr(getdate()["year"], -2, 2);
      $nextid .= getdate()["mon"];
      $nextid .= getdate()["mday"];
      $nextid .= substr("000000" . $lastid, -6, 6);
      // echo $nextid;


  if(isset($_POST['credit_card']) && $_POST['credit_card'] == 'other' ){
    $sql = "INSERT INTO `card_user`(`user_id`, `card_name`, `card_no`, `expire_month`, `expire_year`, `cvc_no`, `address`, `post`)
    VALUES ('".$_POST['user_id']."','".$_POST['card_name']."','".$_POST['card_no']."','".$_POST['expire_month']."','".$_POST['expire_year']."',
    '".$_POST['cvc_no']."','".$_POST['address']."','".$_POST['post']."')";
    // echo $sql;
    $rs = getpdo($conn,$sql);
    
    $cards = "SELECT * FROM card_user ORDER BY id DESC";
    $rsd = getpdo($conn,$cards);
    
    
    if(isset($rsd) && count($rsd) > 0){
      $card_id = $rsd[0]['id'];

      $sql2 = "INSERT INTO `orders`(`order_id`,`user_id`,`card_id`, `address`, `payment_status`, `total_price`, `remark`, `created_at`, `updated_at`)
      VALUES ('".$nextid."','".$_POST['user_id']."','".$card_id."','".$_POST['address']."','1','".$_POST['total_price']."','".$_POST['remark']."',
      '".$date_now."', '".$date_now."')";
      // echo $sql2;
      $rs2 = getpdo($conn,$sql2);

      
      $orders = "SELECT * FROM orders ORDER BY order_id DESC";
      $rsds = getpdo($conn,$orders);
      if(isset($rsds) && count($rsds) > 0){
        $order_id =  $rsds[0]['order_id'];   
        // echo  $order_id;
        $arr = json_decode($carts, true);
        foreach($arr as $key => $value) {
          $sql_pro = "SELECT * FROM `cart`
          JOIN `product` ON `cart`.`product_id` = `product`.`product_id`
          -- JOIN `racket_detail` ON `product`.`product_id` = `racket_detail`.`fk_product_id` 
          WHERE `cart`.`cart_id` = '".$value['cart_id']."' ORDER BY `cart`.`cart_id` ASC";
          $rs = getpdo($conn,$sql_pro);
          // echo json_encode($rs);
          $sql3 = "INSERT INTO `order_details`(`order_id`, `product_id`, `price`,`amount`,`remark`) 
          VALUES ('".$order_id."','".$rs[0]['product_id']."','".$rs[0]['price']."','".$rs[0]['amount']."','".$rs[0]['remark']."')";
          $rs3 = getpdo($conn,$sql3);
        
        }
      }
    }
  }else{
    $sql2 = "INSERT INTO `orders`(`order_id`,`user_id`,`card_id`, `address`, `payment_status`, `total_price`, `remark`, `created_at`, `updated_at`)
    VALUES ('".$nextid."','".$_POST['user_id']."','".$_POST['credit_card']."','".$_POST['address']."','1','".$_POST['total_price']."','".$_POST['remark']."',
    '".$date_now."', '".$date_now."')";
    // echo $sql2;
    $rs2 = getpdo($conn,$sql2);

    
    $orders = "SELECT * FROM orders ORDER BY order_id DESC";
    $rsds = getpdo($conn,$orders);
    if(isset($rsds) && count($rsds) > 0){
      $order_id =  $rsds[0]['order_id'];   
      // echo  $order_id;
      $arr = json_decode($carts, true);
      foreach($arr as $key => $value) {
        $sql_pro = "SELECT * FROM `cart`
        JOIN `product` ON `cart`.`product_id` = `product`.`product_id`
        --  JOIN `racket_detail` ON `product`.`product_id` = `racket_detail`.`fk_product_id` 
        WHERE `cart`.`cart_id` = '".$value['cart_id']."' ORDER BY `cart`.`cart_id` ASC";
        // echo $sql_pro;
        $rs = getpdo($conn,$sql_pro);
        // echo json_encode($rs);
        $sql3 = "INSERT INTO `order_details`(`order_id`, `product_id`, `price`,`amount`,`remark`) 
        VALUES ('".$order_id."','".$rs[0]['product_id']."','".$rs[0]['price']."','".$rs[0]['amount']."','".$rs[0]['remark']."')";
        // echo $sql3;
        $rs3 = getpdo($conn,$sql3);

        $strSQL = "DELETE FROM cart WHERE cart_id = '".$value['cart_id']."'";
        $result = getpdo($conn,$strSQL);

        $sql_quantity = "UPDATE `product` SET `quantity`= -'".$rs[0]['quantity']."' WHERE `product_id`= '".$rs[0]['product_id']."'";
        // echo $sql_quantity;
        $rs4 = getpdo($conn,$sql_quantity);
        
      }
    }
  }

  Header("Location: ../orderdetail.html");
  
?>
