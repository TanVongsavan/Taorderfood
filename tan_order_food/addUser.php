<?php
header("content-type:text/javascript;charset=utf-8");
error_reporting(0);
error_reporting(E_ERROR | E_PARSE);
$link = mysqli_connect('localhost', 'root', '', "tanfood");

if (!$link) {
    echo "Error: Unable to connect to MySQL." . PHP_EOL;
    echo "Debugging errno: " . mysqli_connect_errno() . PHP_EOL;
    echo "Debugging error: " . mysqli_connect_error() . PHP_EOL;
    exit;
}

if (!$link->set_charset("utf8")) {
    printf("Error loading character set utf8: %s\n", $link->error);
    exit();
}

// if (isset($_GET)) {
//     if ($_GET['isAdd'] == 'true') {
//         $name = mysqli_real_escape_string($link, $_GET['Name']);
//         $user = mysqli_real_escape_string($link, $_GET['User']);
//         $password = mysqli_real_escape_string($link, $_GET['Password']);
//         $chooseType = mysqli_real_escape_string($link, $_GET['ChooseType']);
    if (isset($_GET)) {
    if ($_GET['isAdd'] == 'true') {         
        $name = $_GET['Name'];
        $user = $_GET['User'];
        $password = $_GET['Password'];
        $chooseType = $_GET['ChooseType'];

        $sql = "INSERT INTO  `usertable`(`id`, `ChooseType`, `Name`, `User`, `Password`) VALUES (Null, '$chooseType', '$name','$user','$password')";

        $result = mysqli_query($link, $sql);

        if ($result) {
            echo "true";
        } else {
            echo "false";
        }
    } else {
        echo "Welcome Ta Food";
    }
}

mysqli_close($link);
?>