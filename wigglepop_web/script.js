/* ===============================
   AUTH STATE
================================ */
let isLoggedIn = false;
let currentUser = null;

/* ===============================
   CHECK LOGIN STATUS
================================ */
function checkLoginStatus() {
  const savedUser = sessionStorage.getItem("wigglePopUser");
  if (savedUser) {
    isLoggedIn = true;
    currentUser = JSON.parse(savedUser);
    updateNavbar();
  }
}

/* ===============================
   NAVBAR
================================ */
function updateNavbar() {
  const loginBtn = document.getElementById("navLoginBtn");
  const logoutBtn = document.getElementById("navLogoutBtn");

  if (!loginBtn || !logoutBtn) return;

  if (isLoggedIn) {
    loginBtn.style.display = "none";
    logoutBtn.style.display = "block";
  } else {
    loginBtn.style.display = "block";
    logoutBtn.style.display = "none";
  }
}

/* ===============================
   CART
================================ */
let cart = [];

function loadCart() {
  const savedCart = sessionStorage.getItem("wigglePopCart");
  if (savedCart) cart = JSON.parse(savedCart);
  updateCartDisplay();
}

function saveCart() {
  sessionStorage.setItem("wigglePopCart", JSON.stringify(cart));
}

function addToCart(name, price, emoji, image = null, color = null) {
  if (!isLoggedIn) {
    showNotification("Login dulu ya sebelum belanja!");
    setTimeout(() => (window.location.href = "login.html"), 1500);
    return;
  }

  const existing = cart.find(
    (item) => item.name === name && item.color === color
  );

  if (existing) {
    existing.quantity++;
  } else {
    cart.push({
      name,
      price,
      emoji,
      image,
      color,
      quantity: 1,
    });
  }

  saveCart();
  updateCartDisplay();
  showNotification("Produk ditambahkan ke keranjang!");
}

function removeFromCart(index) {
  cart.splice(index, 1);
  saveCart();
  updateCartDisplay();
}

function updateQuantity(index, change) {
  cart[index].quantity += change;
  if (cart[index].quantity <= 0) removeFromCart(index);
  saveCart();
  updateCartDisplay();
}

/* ===============================
   CART DISPLAY
================================ */
function updateCartDisplay() {
  const container = document.getElementById("cartItems");
  const totalItemsEl = document.getElementById("totalItems");
  const totalPriceEl = document.getElementById("totalPrice");

  if (!container) return;

  if (cart.length === 0) {
    container.innerHTML = `
      <div class="empty-cart">
        <h3>Keranjang kosong 🛒</h3>
        <a href="katalog.html">Mulai Belanja</a>
      </div>`;
    return;
  }

  let totalItems = 0;
  let totalPrice = 0;
  container.innerHTML = "";

  cart.forEach((item, index) => {
    totalItems += item.quantity;
    totalPrice += item.price * item.quantity;

    container.innerHTML += `
      <div class="cart-item">
        <div class="cart-img">
          ${item.image ? `<img src="${item.image}">` : item.emoji}
        </div>
        <div class="cart-info">
          <h4>${item.name}</h4>
          <p>Rp ${item.price.toLocaleString("id-ID")}</p>
          <div class="qty">
            <button onclick="updateQuantity(${index},-1)">-</button>
            <span>${item.quantity}</span>
            <button onclick="updateQuantity(${index},1)">+</button>
          </div>
        </div>
        <button onclick="removeFromCart(${index})">Hapus</button>
      </div>`;
  });

  if (totalItemsEl) totalItemsEl.textContent = totalItems;
  if (totalPriceEl)
    totalPriceEl.textContent = `Rp ${totalPrice.toLocaleString("id-ID")}`;
}

/* ===============================
   NOTIFICATION
================================ */
function showNotification(message) {
  const notif = document.createElement("div");
  notif.className = "notification";
  notif.textContent = message;
  document.body.appendChild(notif);

  setTimeout(() => notif.remove(), 3000);
}

/* ===============================
   LOGIN (PHP)
================================ */
function handleLogin(e) {
  e.preventDefault();

  const formData = new FormData(e.target);

  fetch("login_process.php", {
    method: "POST",
    body: formData,
  })
    .then((res) => res.text())
    .then((res) => {
      if (res === "success") {
        isLoggedIn = true;
        currentUser = { email: formData.get("email") };
        sessionStorage.setItem("wigglePopUser", JSON.stringify(currentUser));
        showNotification("Login berhasil!");
        setTimeout(() => (window.location.href = "index.html"), 1000);
      } else {
        alert("Email atau password salah!");
      }
    });
}

/* ===============================
   REGISTER (PHP)
================================ */
function handleRegister(e) {
  e.preventDefault();

  const formData = new FormData(e.target);

  fetch("register_process.php", {
    method: "POST",
    body: formData,
  })
    .then((res) => res.text())
    .then((res) => {
      if (res === "success") {
        alert("Registrasi berhasil, silakan login!");
        showLoginForm();
      } else if (res === "email_exists") {
        alert("Email sudah terdaftar!");
      } else {
        alert("Registrasi gagal!");
      }
    });
}

/* ===============================
   LOGOUT
================================ */
function handleLogout(e) {
  e.preventDefault();
  sessionStorage.clear();
  isLoggedIn = false;
  cart = [];
  updateNavbar();
  showNotification("Logout berhasil");
  setTimeout(() => (window.location.href = "index.html"), 1000);
}

/* ===============================
   CHECKOUT (PHP)
================================ */
function processCheckout(e) {
  e.preventDefault();

  if (cart.length === 0) {
    alert("Keranjang kosong!");
    return;
  }

  const formData = new FormData(e.target);
  formData.append("cart", JSON.stringify(cart));

  fetch("checkout_process.php", {
    method: "POST",
    body: formData,
  })
    .then((res) => res.text())
    .then((res) => {
      if (res === "success") {
        alert("Pesanan berhasil!");
        cart = [];
        saveCart();
        updateCartDisplay();
        closeCheckoutForm();
      } else {
        alert("Checkout gagal!");
      }
    });
}

/* ===============================
   MODAL
================================ */
function showCheckoutForm() {
  document.getElementById("checkoutModal").classList.add("show");
}

function closeCheckoutForm() {
  document.getElementById("checkoutModal").classList.remove("show");
}

/* ===============================
   DOM READY
================================ */
document.addEventListener("DOMContentLoaded", () => {
  checkLoginStatus();
  loadCart();
});
