cat << 'EOF' > src/main/webapp/index.jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    List> products = new ArrayList<>();

    String[][] catalogData = {
        {"101", "Apple iPhone 16 (128 GB) - Ultramarine", "Mobiles", "79900", "89900", "4.6", "14,230", "Free Delivery by Tomorrow", "https://placehold.co/300x300/f8fafc/1e293b?text=iPhone+16"},
        {"102", "Samsung Galaxy S24 Ultra 5G (Titanium Gray, 256 GB)", "Mobiles", "119999", "134999", "4.7", "8,912", "Assured | Free Delivery", "https://placehold.co/300x300/f8fafc/1e293b?text=Galaxy+S24+Ultra"},
        {"103", "ASUS Vivobook 15, Intel Core i5-1335U, 16GB RAM, 512GB SSD", "Electronics", "54990", "69990", "4.3", "3,410", "No Cost EMI Available", "https://placehold.co/300x300/f8fafc/1e293b?text=ASUS+Vivobook+15"},
        {"104", "Sony WH-1000XM5 Wireless Noise Cancelling Headphones", "Electronics", "26990", "34990", "4.8", "6,105", "Best Seller", "https://placehold.co/300x300/f8fafc/1e293b?text=Sony+WH-1000XM5"},
        {"105", "Nike Revolution 7 Running Shoes for Men (Black/White)", "Fashion", "3295", "3695", "4.2", "1,890", "Free Delivery", "https://placehold.co/300x300/f8fafc/1e293b?text=Nike+Shoes"},
        {"106", "Allen Solly Men's Regular Fit Cotton Polo T-Shirt", "Fashion", "699", "1199", "4.1", "22,450", "Top Deal", "https://placehold.co/300x300/f8fafc/1e293b?text=Polo+T-Shirt"},
        {"107", "Philips Digital Air Fryer HD9252/90 (4.1L, Black)", "Appliances", "7999", "11995", "4.5", "9,870", "1 Year Warranty", "https://placehold.co/300x300/f8fafc/1e293b?text=Philips+Air+Fryer"},
        {"108", "LG 260 L 3 Star Frost-Free Double Door Refrigerator", "Appliances", "24490", "31990", "4.4", "5,320", "Free Installation", "https://placehold.co/300x300/f8fafc/1e293b?text=LG+Refrigerator"}
    };

    for (String[] item : catalogData) {
        Map<String, String> p = new HashMap<>();
        p.put("id", item[0]);
        p.put("name", item[1]);
        p.put("category", item[2]);
        p.put("price", item[3]);
        p.put("mrp", item[4]);
        p.put("rating", item[5]);
        p.put("reviews", item[6]);
        p.put("badge", item[7]);
        p.put("img", item[8]);
        products.add(p);
    }

    String[] categories = {"All", "Mobiles", "Electronics", "Fashion", "Appliances"};
    String serverTimestamp = new java.text.SimpleDateFormat("dd MMM yyyy, hh:mm a").format(new Date());
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ShopKart - Online Shopping</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; font-family: Arial, Helvetica, sans-serif; }
        body { background-color: #eaeded; color: #0f1111; }
        .navbar { background-color: #131921; color: #fff; display: flex; align-items: center; padding: 10px 20px; gap: 16px; position: sticky; top: 0; z-index: 100; }
        .logo { font-size: 24px; font-weight: bold; color: #fff; text-decoration: none; }
        .logo span { color: #febd69; font-style: italic; }
        .location-box { font-size: 12px; line-height: 1.2; min-width: 130px; }
        .location-box strong { font-size: 13px; display: block; }
        .search-bar { flex: 1; display: flex; height: 40px; border-radius: 4px; overflow: hidden; }
        .search-bar select { background: #f3f3f3; border: none; padding: 0 10px; color: #333; font-size: 13px; border-right: 1px solid #cdcdcd; }
        .search-bar input { flex: 1; border: none; padding: 0 12px; font-size: 15px; outline: none; }
        .search-bar button { background: #febd69; border: none; padding: 0 18px; font-weight: bold; cursor: pointer; font-size: 15px; }
        .nav-actions { display: flex; align-items: center; gap: 20px; font-size: 13px; }
        .nav-item strong { display: block; font-size: 14px; }
        .cart-btn { display: flex; align-items: center; gap: 6px; background: #232f3e; padding: 8px 14px; border-radius: 4px; cursor: pointer; font-weight: bold; }
        .cart-count { background: #f08804; color: #111; padding: 2px 7px; border-radius: 12px; font-size: 13px; }
        .subnav { background-color: #232f3e; color: #fff; padding: 8px 20px; display: flex; gap: 18px; font-size: 14px; }
        .subnav span { cursor: pointer; padding: 4px 8px; border-radius: 3px; }
        .subnav span:hover, .subnav span.active { background-color: #37475a; color: #febd69; font-weight: bold; }
        .hero { background: linear-gradient(135deg, #2874f0 0%, #131921 100%); color: white; padding: 36px 40px; margin: 15px 20px; border-radius: 6px; display: flex; justify-content: space-between; align-items: center; }
        .hero h1 { font-size: 28px; margin-bottom: 8px; }
        .hero-tag { background: #febd69; color: #111; padding: 5px 12px; font-weight: bold; border-radius: 3px; font-size: 13px; display: inline-block; margin-bottom: 8px; }
        .container { max-width: 1400px; margin: 0 auto; padding: 10px 20px 40px; }
        .section-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 15px; }
        .product-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(270px, 1fr)); gap: 18px; }
        .card { background: #fff; border-radius: 6px; padding: 16px; display: flex; flex-direction: column; justify-content: space-between; box-shadow: 0 1px 3px rgba(0,0,0,0.1); }
        .card img { width: 100%; height: 200px; object-fit: contain; margin-bottom: 12px; }
        .card-category { font-size: 11px; color: #565959; text-transform: uppercase; margin-bottom: 4px; }
        .card-title { font-size: 15px; font-weight: 600; margin-bottom: 8px; line-height: 1.35; }
        .rating-row { display: flex; align-items: center; gap: 6px; margin-bottom: 8px; font-size: 13px; }
        .rating-badge { background: #388e3c; color: #fff; padding: 2px 6px; border-radius: 3px; font-weight: bold; font-size: 12px; }
        .price-row { margin-bottom: 6px; }
        .price { font-size: 21px; font-weight: bold; }
        .mrp { font-size: 13px; color: #565959; text-decoration: line-through; margin-left: 6px; }
        .discount { font-size: 13px; color: #388e3c; font-weight: bold; margin-left: 6px; }
        .delivery-badge { font-size: 12px; color: #007600; font-weight: 600; margin-bottom: 12px; }
        .btn-group { display: flex; gap: 8px; }
        .btn-cart { flex: 1; background: #ffd814; border: 1px solid #fcd200; border-radius: 20px; padding: 8px; font-weight: bold; cursor: pointer; font-size: 13px; }
        .btn-buy { flex: 1; background: #ffa41c; border: 1px solid #ff8f00; border-radius: 20px; padding: 8px; font-weight: bold; cursor: pointer; font-size: 13px; }
        .cart-drawer { position: fixed; top: 0; right: -380px; width: 360px; height: 100vh; background: #fff; box-shadow: -4px 0 15px rgba(0,0,0,0.2); transition: right 0.25s ease; z-index: 200; display: flex; flex-direction: column; }
        .cart-drawer.open { right: 0; }
        .cart-header { background: #232f3e; color: #fff; padding: 16px; display: flex; justify-content: space-between; align-items: center; }
        .cart-items { flex: 1; overflow-y: auto; padding: 16px; }
        .cart-item { display: flex; justify-content: space-between; align-items: center; border-bottom: 1px solid #eee; padding: 10px 0; font-size: 14px; }
        .cart-footer { padding: 16px; border-top: 1px solid #ddd; background: #f8f9fa; }
        .checkout-btn { width: 100%; background: #ffd814; border: none; padding: 12px; font-weight: bold; border-radius: 6px; cursor: pointer; font-size: 15px; margin-top: 10px; }
        footer { background: #131921; color: #ddd; text-align: center; padding: 24px; font-size: 13px; }
    </style>
</head>
<body>
    <header class="navbar">
        <a href="index.jsp" class="logo">Shop<span>Kart</span></a>
        <div class="location-box">Deliver to Nithin<strong>Bengaluru 560001</strong></div>
        <div class="search-bar">
            <select id="categorySelect" onchange="filterProducts()">
                <% for (String cat : categories) { %>
                    <option value="<%= cat %>"><%= cat %></option>
                <% } %>
            </select>
            <input type="text" id="searchInput" placeholder="Search for Mobiles, Laptops, Shoes and more..." onkeyup="filterProducts()">
            <button onclick="filterProducts()">Search</button>
        </div>
        <div class="nav-actions">
            <div class="nav-item">Hello, Nithin<strong>Account &amp; Lists</strong></div>
            <div class="nav-item">Returns<strong>&amp; Orders</strong></div>
            <div class="cart-btn" onclick="toggleCart()">Cart <span class="cart-count" id="cartCount">0</span></div>
        </div>
    </header>

    <nav class="subnav" id="categoryTabs">
        <% for (String cat : categories) { %>
            <span class="<%= cat.equals("All") ? "active" : "" %>" onclick="selectCategory('<%= cat %>', this)"><%= cat %></span>
        <% } %>
    </nav>

    <section class="hero">
        <div>
            <span class="hero-tag">BIG SAVING DAYS</span>
            <h1>Up to 40% Off on Top Electronics &amp; Smartphones</h1>
            <p>No Cost EMI | Instant 10% Bank Discount | Free Next-Day Delivery</p>
        </div>
        <div style="text-align: right; font-size: 13px; color: #cbd5e1;">
            Server Node: <%= application.getServerInfo() %><br>
            Loaded at: <%= serverTimestamp %>
        </div>
    </section>

    <main class="container">
        <div class="section-header">
            <h2 id="sectionTitle">Featured Deals (All Categories)</h2>
            <span id="resultCount"><%= products.size() %> products available</span>
        </div>
        <div class="product-grid" id="productGrid">
            <%
                for (Map<String, String> p : products) {
                    int price = Integer.parseInt(p.get("price"));
                    int mrp = Integer.parseInt(p.get("mrp"));
                    int discountPercent = (int) Math.round(((mrp - price) * 100.0) / mrp);
            %>
            <div class="card product-card" data-category="<%= p.get("category") %>" data-name="<%= p.get("name").toLowerCase() %>">
                <div>
                    <img src="<%= p.get("img") %>" alt="<%= p.get("name") %>">
                    <div class="card-category"><%= p.get("category") %></div>
                    <div class="card-title"><%= p.get("name") %></div>
                    <div class="rating-row">
                        <span class="rating-badge"><%= p.get("rating") %> &#9733;</span>
                        <span>(<%= p.get("reviews") %>)</span>
                    </div>
                    <div class="price-row">
                        <span class="price">&#8377;<%= String.format("%,d", price) %></span>
                        <span class="mrp">&#8377;<%= String.format("%,d", mrp) %></span>
                        <span class="discount"><%= discountPercent %>% off</span>
                    </div>
                    <div class="delivery-badge"><%= p.get("badge") %></div>
                </div>
                <div class="btn-group">
                    <button class="btn-cart" onclick="addToCart('<%= p.get("id") %>', '<%= p.get("name").replace("'", "\\'") %>', <%= price %>)">Add to Cart</button>
                    <button class="btn-buy" onclick="buyNow('<%= p.get("name").replace("'", "\\'") %>', <%= price %>)">Buy Now</button>
                </div>
            </div>
            <% } %>
        </div>
    </main>

    <aside class="cart-drawer" id="cartDrawer">
        <div class="cart-header">
            <h3>Shopping Cart</h3>
            <button onclick="toggleCart()" style="background:none; border:none; color:#fff; font-size:20px; cursor:pointer;">&times;</button>
        </div>
        <div class="cart-items" id="cartItemsList">
            <p style="color:#666; text-align:center; margin-top:40px;">Your cart is empty.</p>
        </div>
        <div class="cart-footer">
            <div style="display:flex; justify-content:space-between; font-weight:bold; font-size:16px;">
                <span>Subtotal:</span>
                <span id="cartTotal">&#8377;0</span>
            </div>
            <button class="checkout-btn" onclick="checkout()">Proceed to Buy</button>
        </div>
    </aside>

    <footer>&copy; 2026 ShopKart E-Commerce Pvt. Ltd. | Deployed on Apache Tomcat (JSP)</footer>

    <script>
        let cart = [];
        function selectCategory(category, element) {
            document.getElementById("categorySelect").value = category;
            document.querySelectorAll("#categoryTabs span").forEach(el => el.classList.remove("active"));
            element.classList.add("active");
            filterProducts();
        }
        function filterProducts() {
            const selectedCat = document.getElementById("categorySelect").value;
            const query = document.getElementById("searchInput").value.toLowerCase().trim();
            const cards = document.querySelectorAll(".product-card");
            let visibleCount = 0;
            cards.forEach(card => {
                const cat = card.getAttribute("data-category");
                const name = card.getAttribute("data-name");
                if ((selectedCat === "All" || cat === selectedCat) && name.includes(query)) {
                    card.style.display = "flex";
                    visibleCount++;
                } else {
                    card.style.display = "none";
                }
            });
            document.getElementById("sectionTitle").innerText = "Featured Deals (" + selectedCat + ")";
            document.getElementById("resultCount").innerText = visibleCount + " products available";
        }
        function addToCart(id, name, price) {
            const existing = cart.find(item => item.id === id);
            if (existing) { existing.qty += 1; } else { cart.push({ id, name, price, qty: 1 }); }
            renderCart();
        }
        function removeFromCart(id) {
            cart = cart.filter(item => item.id !== id);
            renderCart();
        }
        function renderCart() {
            const list = document.getElementById("cartItemsList");
            const countBadge = document.getElementById("cartCount");
            const totalEl = document.getElementById("cartTotal");
            let totalQty = 0, totalPrice = 0;
            if (cart.length === 0) {
                list.innerHTML = '<p style="color:#666; text-align:center; margin-top:40px;">Your cart is empty.</p>';
                countBadge.innerText = "0";
                totalEl.innerText = "\u20B90";
                return;
            }
            list.innerHTML = cart.map(item => {
                totalQty += item.qty;
                totalPrice += item.price * item.qty;
                return '<div class="cart-item"><div style="max-width:220px;"><div style="font-weight:bold;">' + item.name + '</div><div style="color:#555; margin-top:4px;">\u20B9' + item.price.toLocaleString('en-IN') + ' &times; ' + item.qty + '</div></div><button onclick="removeFromCart(\'' + item.id + '\')" style="color:#b12704; background:none; border:none; cursor:pointer; font-size:12px;">Remove</button></div>';
            }).join("");
            countBadge.innerText = totalQty;
            totalEl.innerText = "\u20B9" + totalPrice.toLocaleString('en-IN');
        }
        function toggleCart() { document.getElementById("cartDrawer").classList.toggle("open"); }
        function buyNow(name, price) { alert("Express Checkout:\nItem: " + name + "\nTotal Payable: \u20B9" + price.toLocaleString('en-IN')); }
        function checkout() {
            if (cart.length === 0) { alert("Your cart is empty!"); return; }
            alert("Order placed successfully!");
            cart = []; renderCart(); toggleCart();
        }
    </script>
</body>
</html>
EOF
