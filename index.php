<?php
require_once '/vendor/autoload.php';
include('credentials.php');

use Aws\Exception\AwsException;

function add($num1, $num2){
    $add = $num1 + $num2;
    return $add;
}
 
if(isset($_SERVER['NUM1']) && isset($_SERVER['NUM2'])){
    $num1 = $_SERVER['NUM1'];
    $num2 = $_SERVER['NUM2'];
}else{
    $num1 = 5;
    $num2 = 2;
}
 
$res = add($num1, $num2);
$data = array('num1' => $num1, 'num2' => $num2, 'result' => $res);
echo json_encode($data);
return json_encode($data);
exit();



?>