<?php
header("content-type:text/javascript;charset=utf-8");
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

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

if (isset($_GET)) {
    if ($_GET['isAdd'] == 'true') {
        $user = $_GET['User'];

        $result = mysqli_query($link, "SELECT * FROM usertable WHERE User = '$user'");

        if ($result) {
            $output = [];
            while ($row = mysqli_fetch_assoc($result)) {
                $output[] = $row;
            }

            echo json_encode($output);  // ຄືນ array ເທື່ອຫາໄດ້
        } else {
            echo json_encode([]);  // ຖ້າບໍ່ໄດ້ຜົນລັບ
        }

        mysqli_close($link);
    }
}
?>