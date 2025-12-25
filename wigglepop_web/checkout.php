<?php
session_start();
include 'koneksi.php';

if (!isset($_SESSION['user_id'])) {
    echo "login_required";
    exit;
}

$user_id = $_SESSION['user_id'];

// Data customer
$customer_name    = $_POST['customer_name'];
$customer_phone   = $_POST['customer_phone'];
$customer_address = $_POST['customer_address'];
$payment_method   = $_POST['payment_method'];

$cart = json_decode($_POST['cart'], true);

$total_amount = 0;
foreach ($cart as $item) {
    $subtotal = $item['price'] * $item['quantity'];
    $total_amount += $subtotal;
}

// INSERT ke tabel orders
$queryOrder = "INSERT INTO orders 
(user_id, customer_name, customer_phone, customer_address, payment_method, total_amount, status, created_at, updated_at)
VALUES 
('$user_id', '$customer_name', '$customer_phone', '$customer_address', '$payment_method', '$total_amount', 'pending', NOW(), NOW())";

mysqli_query($conn, $queryOrder);
$order_id = mysqli_insert_id($conn);

// INSERT ke order_items + kurangi stok
foreach ($cart as $item) {
    $product_id   = $item['product_id'];
    $product_name = $item['product_name'];
    $color_name   = $item['color_name'];
    $color_value  = $item['color_value'];
    $price        = $item['price'];
    $quantity     = $item['quantity'];
    $subtotal     = $price * $quantity;

    // insert order_items
    mysqli_query($conn, "INSERT INTO order_items 
    (order_id, product_id, product_name, color_name, color_value, price, quantity, subtotal, created_at)
    VALUES 
    ('$order_id', '$product_id', '$product_name', '$color_name', '$color_value', '$price', '$quantity', '$subtotal', NOW())");

    // kurangi stok produk
    mysqli_query($conn, "UPDATE products 
        SET rating = rating, reviews = reviews, updated_at = NOW()
        WHERE id = '$product_id'");
}

echo "success";
