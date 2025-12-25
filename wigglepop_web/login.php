<?php
session_start();
include 'koneksi.php';

if (isset($_POST['login'])) {
    $email = $_POST['email'];
    $password = $_POST['password'];

    $query = mysqli_query($conn, "SELECT * FROM users WHERE email='$email'");
    $user = mysqli_fetch_assoc($query);

    if ($user && password_verify($password, $user['password'])) {
        $_SESSION['user_id'] = $user['id'];
        $_SESSION['user_name'] = $user['first_name'];
        echo "success";
    } else {
        echo "failed";
    }
    exit;
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Login / Daftar - Wiggle Pop</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<section class="auth-section">
    <div class="auth-wrapper">
        <h2>Login Wiggle Pop</h2>

        <form id="loginForm">
            <input type="email" name="email" id="loginEmail" placeholder="Email" required>
            <input type="password" name="password" id="loginPassword" placeholder="Password" required>

            <button type="submit">Login</button>
        </form>

        <p id="loginMessage"></p>
    </div>
</section>

<script>
document.getElementById("loginForm").addEventListener("submit", function(e) {
    e.preventDefault();

    const formData = new FormData();
    formData.append("email", document.getElementById("loginEmail").value);
    formData.append("password", document.getElementById("loginPassword").value);
    formData.append("login", "true");

    fetch("login.php", {
        method: "POST",
        body: formData
    })
    .then(res => res.text())
    .then(data => {
        if (data === "success") {
            alert("Login berhasil!");
            window.location.href = "index.html";
        } else {
            document.getElementById("loginMessage").innerText =
                "Email atau password salah!";
        }
    });
});
</script>

</body>
</html>
