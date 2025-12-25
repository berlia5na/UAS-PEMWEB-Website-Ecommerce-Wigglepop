

<?php

include 'koneksi.php';

$email      = $_POST['email'];
$first_name = $_POST['first_name'];
$last_name  = $_POST['last_name'];
$phone      = $_POST['phone'];
$password   = password_hash($_POST['password'], PASSWORD_DEFAULT);

// Cek email
$cek = mysqli_query($conn, "SELECT * FROM users WHERE email='$email'");
if (mysqli_num_rows($cek) > 0) {
    echo "email_exists";
    exit;
}

$query = "INSERT INTO users 
(email, first_name, last_name, phone, password)
VALUES 
('$email', '$first_name', '$last_name', '$phone', '$password')";

if (mysqli_query($conn, $query)) {
    echo "success";
} else {
    echo "error";
}
