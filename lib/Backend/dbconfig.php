<?php

$db_name = "cmpe172";
$db_user = "cmpe172learningapp";
$di_pass = "eoF/5$8x/5#QENhO";
$db_host = "localhost";

$con = mysql_connect($db_host, $db_user, $db_pass, $db_name)

if(!$con)
{
    echo json_encode("Error");
}
else
{
    echo json_encode("connection successful");
}
?>