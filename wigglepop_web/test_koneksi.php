<?php
// Include file koneksi
require_once 'koneksi.php';

// Cek apakah koneksi berhasil
if ($conn) {
    echo "<h2 style='color: green;'>Koneksi ke database BERHASIL!</h2>";
    echo "<p>Host: " . $host . "<br>";
    echo "Database: " . $db . "<br>";
    echo "User: " . $user . "</p>";
    
    // Optional: Tampilkan versi MySQL/MariaDB
    $version = mysqli_get_server_info($conn);
    echo "<p>Versi Server MySQL/MariaDB: " . $version . "</p>";
    
    // Optional: Test query sederhana
    $query = "SHOW TABLES";
    $result = mysqli_query($conn, $query);
    
    if ($result) {
        $table_count = mysqli_num_rows($result);
        echo "<p>Ada " . $table_count . " tabel di database <strong>" . $db . "</strong>:</p>";
        echo "<ul>";
        while ($row = mysqli_fetch_array($result)) {
            echo "<li>" . $row[0] . "</li>";
        }
        echo "</ul>";
    } else {
        echo "<p style='color: orange;'>Query test gagal: " . mysqli_error($conn) . "</p>";
    }
    
    // Tutup koneksi
    mysqli_close($conn);
} else {
    echo "<h2 style='color: red;'>Koneksi GAGAL!</h2>";
    echo "<p>Error: " . mysqli_connect_error() . "</p>";
}
?>