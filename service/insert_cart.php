<?php 
  require_once 'config.php';
?>

<?php
  if(isset($_POST["user_id"])){
    $date = date_create();
    $date_now = date_format($date, 'Y-m-d H:i:s') . "\n";
    $sql = "SELECT * FROM `cart` WHERE `user_id` = '".$_POST['user_id']."' and `product_id` = '".($_POST['product_id'])."'";
    $rs = getpdo($conn,$sql);
    if(isset($rs) && count($rs) > 0){
      $amount = $rs[0]['amount'] + 1;
      $sql = "UPDATE `cart` SET `amount`= '".$amount."' WHERE `cart_id` = '".$rs[0]['cart_id']."'";
      $rs = getpdo($conn,$sql);
    }else{
      $sql = "INSERT INTO `cart`(`user_id`, `product_id`, `amount`,`created_at`,`updated_at`,`remark`) VALUES ('".$_POST['user_id']."','".$_POST['product_id']."',";

      if(isset($_POST['amount']) == ''){
        $sql .= " '1' ";
      }else{
        $sql .= " '".$_POST['amount']."' ";
      }
      $sql .= ", '".$date_now."', '".$date_now."', ";

      if (isset($_POST['remark']) == '') {
        $sql .= " '' ";
      } else {
        $sql .= " '".$_POST['remark']."' ";
      }
      $sql .= " ) ";
      // echo $sql;
      $rs = getpdo($conn,$sql);
    }
   
    if($rs){
      $res = array("code" => 200, "result" => $rs);
      echo json_encode($res);
      return ;

    }
    // if(!$rs)
    // {
    //   echo "<script>";
    //     echo "alert(\" บันทึกไม่สำเร็จ\");"; 
    //     echo "window.history.back()";
    //   echo "</script>";
    // }else{
    //   echo "<script>";
    //     echo "swal(\"Hello world!\");"; 
    //     echo "window.history.back()";
    //   echo "</script>";
    // }
    $result = array("message" => "Error someting");
    $res = array("code" => 401, "result" => $result, "sql" => $sql );
    echo json_encode($res);
  }
?>
