<?php
session_start();
require 'koneksi.php';

if (!isset($_SESSION['user_id'])) {
    echo "not_logged_in";
    exit;
}

$user_id = $_SESSION['user_id'];

$name    = $_POST['customer_name'];
$phone   = $_POST['customer_phone'];
$address = $_POST['customer_address'];
$payment = $_POST['payment_method'];
$cart    = json_decode($_POST['cart'], true);

$total = 0;
foreach ($cart as $item) {
    $total += $item['price'] * $item['quantity'];
}

mysqli_begin_transaction($conn);

try {
    // INSERT ORDERS
    $orderQuery = "INSERT INTO orders 
        (user_id, customer_name, customer_phone, customer_address, payment_method, total_amount, status)
        VALUES (?, ?, ?, ?, ?, ?, 'pending')";
    
    $stmt = mysqli_prepare($conn, $orderQuery);
    mysqli_stmt_bind_param($stmt, "issssd", $user_id, $name, $phone, $address, $payment, $total);
    mysqli_stmt_execute($stmt);

    $order_id = mysqli_insert_id($conn);

    // INSERT ORDER ITEMS
    foreach ($cart as $item) {
        $product_id   = $item['id'] ?? null;
        $product_name = $item['name'];
        $price        = $item['price'];
        $qty          = $item['quantity'];
        $subtotal     = $price * $qty;
        $color_name   = $item['color'] ?? '';
        $color_value  = $item['color'] ?? '';

        $itemQuery = "INSERT INTO order_items 
            (order_id, product_id, product_name, color_name, color_value, price, quantity, subtotal)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        $stmtItem = mysqli_prepare($conn, $itemQuery);
        mysqli_stmt_bind_param(
            $stmtItem,
            "iisssdid",
            $order_id,
            $product_id,
            $product_name,
            $color_name,
            $color_value,
            $price,
            $qty,
            $subtotal
        );
        mysqli_stmt_execute($stmtItem);

        // UPDATE STOK PRODUK
        if ($product_id) {
            $stokQuery = "UPDATE products SET stock = stock - ? WHERE id = ?";
            $stmtStok = mysqli_prepare($conn, $stokQuery);
            mysqli_stmt_bind_param($stmtStok, "ii", $qty, $product_id);
            mysqli_stmt_execute($stmtStok);
        }
    }

    mysqli_commit($conn);
    echo "success";

} catch (Exception $e) {
    mysqli_rollback($conn);
    echo "failed";
}
