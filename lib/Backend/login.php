<?php

require_once("dbconfig.php");

$email = $_POST["email"];
$password = $_POST["pass"];

$query = "SELECT * FROM signup WHERE email LIKE '$email'";
$res = mysqli_query($con,$query);
$data = mysqli_fetch_array($res);

if($data[0] >= 1)
{
    $query = "SELECT * FROM signup WHERE password LIKE '$password'";
    $res = mysqli_query($con,$query);
    $data = mysqli_fetch_array($res);

    if($data[1] == $password)
    {
        echo json_encode("true");
        $resarr = array();
        array_push($resarr, array("email" => $data['0'], "password" => $data['1'],));
        json_encode(array("result" => $resarr));
    }
    else
    (
        echo json_encode("false");
    )
}
else
{
    echo json_encode("Do not have an account");
}
?>