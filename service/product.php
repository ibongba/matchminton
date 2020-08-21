<?php
	date_default_timezone_set("Asia/Bangkok");
    header('Content-type: text/html; charset=utf-8');
    require_once 'PDO.php';

    $db_host = 'localhost';
    $db_name = 'matchminton';
    $db_user = 'root';
    $db_pass = '';

    $conn = new PDO("mysql:host=$db_host; dbname=$db_name", $db_user, $db_pass);
    $conn->exec("SET CHARACTER SET utf8");

    if(isset($_POST['action']) && $_POST['action'] == 'create'){
        $sql = "INSERT INTO `product`(`product_name`, `price`, `description`, `quantity`, `brand_id`, `type`) VALUES ('".$_POST['product_name']."','".$_POST['price']."','".$_POST['description']."','".$_POST['quantity']."','".$_POST['brand_id']."','".$_POST['type']."')";
        
        echo $sql;
        $rs = getpdo($conn,$sql);
        if($rs){
        	$lastid = $conn->lastInsertId();
        	
        	if(isset($_FILES['files'])){
        		$total = count($_FILES['files']['name']);

				for( $i=0 ; $i < $total ; $i++ ) {
					$tmpFilePath = $_FILES['files']['tmp_name'][$i];
					if ($tmpFilePath != ""){
					    $newFilePath = "../uploadFiles/" . $_FILES['files']['name'][$i];
					    if(move_uploaded_file($tmpFilePath, $newFilePath)) {
					    	$sql = "INSERT INTO `product_image`(`fk_product_id`, `path`) VALUES ('".$lastid."','".$newFilePath."')";
	        				$rs = getpdo($conn,$sql);
						}
					}
				}
        	}

        	if(isset($_POST['racket']) && $_POST['racket'] == 1){
        		$sql = "INSERT INTO `racket_detail`(`grip_size`, `balance`, `tension`, `weight`, `flex`,`level`,`fk_product_id`) VALUES ('".$_POST['grip_size']."','".$_POST['balance']."','".$_POST['tension']."','".$_POST['weight']."','".$_POST['flex']."','".$_POST['level']."','".$lastid."')";
        		$rs = getpdo($conn,$sql);
        		if($rs){
					$res = array("code" => 200, "result" => $rs);
		        	echo json_encode($res);
		            return ;
				}
        	}
			else{
				$res = array("code" => 200, "result" => $rs);
	        	echo json_encode($res);
	            return ;
			}
        }
    }else if(isset($_POST['action']) && $_POST['action'] == 'calculate' ){
        $exp = $_POST['exp'];
        $f = $_POST['f'];
        $bmi = $_POST['bmi'];
        $sex = $_POST['sex'];

        $style = $_POST['style'];
        $s = $_POST['s'];

        $position = $_POST['position'];
        $position_d = $_POST['position_d'];

        $brand = $_POST['brand'];

        $price = $_POST['price'];


        $sql = "SELECT * FROM `product` JOIN `racket_detail` ON `product`.`product_id` = `racket_detail`.`fk_product_id` LEFT JOIN `product_image` ON `product`.`product_id`= `product_image`.`fk_product_id` WhERE ";

        if(($exp == 1 || $exp == 2) && $f == 1){
            if($sex == 1){
                if($bmi == 0){
                    $sql .= " (`weight` = '2' or `weight` = '3') ";
                }else if($bmi < 19){
                    $sql .= " (`weight` = '3' or `weight` = '4') ";
                }else if($bmi >= 19){
                    $sql .= " (`weight` = '2') ";
                }
            }else{
                if($bmi == 0){
                    $sql .= " (`weight` = '2' or `weight` = '3') ";
                }else if($bmi < 18){
                    $sql .= " (`weight` = '3' or `weight` = '4') ";
                }else if($bmi >= 18){
                    $sql .= " (`weight` = '2') ";
                }
            }

            if(($style == 1 && ($s == 1 || $s ==2)) || ($style == 2 && $s == 1)){
                $sql .= " and (`flex` = '4') ";
            }else{
                $sql .= " and (`flex` = '3') ";
            }

        }else{
            if($sex == 1){
                if($bmi == 0){
                    $sql .= " (`weight` = '2') ";
                }else if($bmi < 19){
                    $sql .= " (`weight` = '3' or `weight` = '4') ";
                }else if($bmi >= 19){
                    $sql .= " (`weight` = '2') ";
                }
            }else{
                if($bmi == 0){
                    $sql .= " (`weight` = '2' ";
                }else if($bmi < 18){
                    $sql .= " (`weight` = '3') ";
                }else if($bmi >= 18){
                    $sql .= " (`weight` = '1' or `weight` = '2') ";
                }
            }

            if(($style == 1 && ($s == 1 || $s ==2)) || ($style == 2 && ($s == 1 || $s ==2)) || ($style == 3 && $s == 3)){
                $sql .= " and (`flex` = '3') ";
            }else if($style == 1 && $s == 3){
                $sql .= " and (`flex` = '4') ";
            }else{
                $sql .= " and (`flex` = '2') ";
            }

        }

        if(($position_d == 2 || $position_d == 3 ) && $position == 3){
            $sql .= " and (`balance` = '1') ";
        }else if($position == 1){
            $sql .= " and (`balance` = '3') ";
        }else{
            $sql .= " and (`balance` = '2') ";
        }

        if($brand == 1){
            $sql .= " and (`brand_id` = '1') ";
        }else if($brand == 2 ){
            $sql .= " and (`brand_id` = '3') ";
        }else{
            $sql .= " and (`brand_id` = '2') ";
        }

        if($price == 1){
            $sql .= " and (`price` <= '2000') ";
        }else if($price == 2 ){
            $sql .= " and (`price` >= '2000'  and `price` <= 3500) ";
        }else{
            $sql .= " and (`price` > '3500') ";
        }

        $rs = getpdo($conn,$sql);
        if($rs){
            $res = array("code" => 200, "result" => $rs);
            echo json_encode($res);
            return ;
        }

    }

    $result = array("message" => "Error someting");
    $res = array("code" => 401, "result" => $result);
    echo json_encode($res);
?>