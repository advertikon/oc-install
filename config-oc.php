<?php

$servername = "mysql";
$username = "user";
$password = "root";
$dbname = "oc";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sqls[] = "update oc_setting set value = '1' where `key` = 'config_ftp_status'";
$sqls[] = "update oc_setting set value = '/' where `key` = 'config_ftp_root'";
$sqls[] = "update oc_setting set value = 'root' where `key` = 'config_ftp_password'";
$sqls[] = "update oc_setting set value = 'user' where `key` = 'config_ftp_username'";
$sqls[] = "update oc_setting set value = 'ftp' where `key` = 'config_ftp_hostname'";
$sqls[] = "update oc_setting set value = '0' where `key` = 'config_error_display'";

foreach ($sqls as $sql) {
    if ($conn->query($sql) !== TRUE) {
        echo "Error: " . $sql . "\n" . $conn->error;
    }
}

echo "FTP configurations are set\n";

$conn->close();
