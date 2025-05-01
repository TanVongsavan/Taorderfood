<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include('connect.php');

if (isset($_GET['isAdd']) && $_GET['isAdd'] == 'true') {
    $user = $_GET['User'];

    $sql = "SELECT * FROM usertable WHERE User = '$user'";
    $result = mysqli_query($conn, $sql);

    if ($row = mysqli_fetch_assoc($result)) {
        echo json_encode($row);
    } else {
        echo "null";
    }
}
?>