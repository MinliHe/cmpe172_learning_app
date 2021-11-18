<?php

require_once("dbconfig.php");

$email = $_POST["email"];
$password = $_POST["pass"];

$query = "SELECT * FROM signup WHERE email LIKE '$email'";
$res = mysqli_query($con, $query);
$data = mysqli_fetch_array($res);

if($data[0] >= 1)
{
    echo json_encode("account already exists.");
}
else
{
    //create account
    $query = "INSERT INTO signup(email, password) VALUES ('$email', '$password')";
    $res = mysqli_query($con,$query);

    if($res)
    {
        echo json_encode("true");
    }
    else
    {
        echo json_encode("false");
    }
}
?>