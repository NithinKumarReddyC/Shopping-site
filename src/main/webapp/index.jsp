<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    // FIX: Declare the list with both generic types.
    List<Map<String, String>> products = new ArrayList<>();

    // id, name, category, price, mrp, rating, reviews, badge, image, specs, emoji
    String[][] catalogData = {
        {"101", "Apple iPhone 16 (128 GB) - Ultramarine", "Mobiles", "79900", "89900", "4.6", "14,230", "Free Delivery by Tomorrow", "https://placehold.co/600x420/f1f5f9/0f172a?text=iPhone+16", "128 GB • A18 chip • 48 MP camera • 6.1-inch display", "📱"},
        {"102", "Samsung Galaxy S24 Ultra 5G (Titanium Gray, 256 GB)", "Mobiles", "119999", "134999", "4.7", "8,912", "Assured Delivery • No Cost EMI", "https://placehold.co/600x420/f1f5f9/0f172a?text=Galaxy+S24+Ultra", "256 GB • Snapdragon 8 Gen 3 • 200 MP camera • S Pen", "📱"},
        {"103", "ASUS Vivobook 15, Intel Core i5-1335U", "Electronics", "54990", "69990", "4.3", "3,410", "No Cost EMI Available", "https://placehold.co/600x420/f1f5f9/0f172a?text=ASUS+Vivobook+15", "Core i5 • 16 GB RAM • 512 GB SSD • 15.6-inch display", "💻"},
        {"104", "Sony WH-1000XM5 Wireless Noise Cancelling Headphones", "Electronics", "26990", "34990", "4.8", "6,105", "Best Seller", "https://placehold.co/600x420/f1f5f9/0f172a?text=Sony+WH-1000XM5", "Wireless • Active noise cancellation • 30-hour battery", "🎧"},
        {"105", "Nike Revolution 7 Running Shoes for Men", "Fashion", "3295", "3695", "4.2", "1,890", "Free Delivery", "https://placehold.co/600x420/f1f5f9/0f172a?text=Nike+Shoes", "Road running • Lightweight • Cushioned sole", "👟"},
        {"106", "Allen Solly Men's Regular Fit Cotton Polo T-Shirt", "Fashion", "699", "1199", "4.1", "22,450", "Top Deal", "https://placehold.co/600x420/f1f5f9/0f172a?text=Polo+T-Shirt", "Cotton blend • Regular fit • Casual wear", "👕"},
        {"107", "Philips Digital Air Fryer HD9252/90", "Appliances", "7999", "11995", "4.5", "9,870", "1 Year Warranty", "https://placehold.co/600x420/f1f5f9/0f172a?text=Philips+Air+Fryer", "4.1 L capacity • Rapid Air technology • Digital controls", "🍟"},
        {"108", "LG 260 L 3 Star Frost-Free Double Door Refrigerator", "Appliances", "24490", "31990", "4.4", "5,320", "Free Installation", "https://placehold.co/600x420/f1f5f9/0f172a?text=LG+Refrigerator", "260 L capacity • 3 Star rating • Frost-free • Double door", "🧊"}
        ,{"109", "Wakefit 3-Seater Fabric Sofa", "Furniture", "24999", "34999", "4.4", "1,245", "Free Delivery • 3 Year Warranty", "https://placehold.co/600x420/f1f5f9/0f172a?text=3-Seater+Sofa", "3-seater • Fabric upholstery • Solid wood frame • Grey", "🛋️"}
        ,{"110", "Queen Size Engineered Wood Bed with Storage", "Furniture", "18999", "27999", "4.2", "986", "Free Installation", "https://placehold.co/600x420/f1f5f9/0f172a?text=Queen+Bed", "Queen size • Hydraulic storage • Engineered wood • Walnut finish", "🛏️"}
        ,{"111", "2-Door Wardrobe with Mirror", "Furniture", "12999", "19999", "4.1", "754", "Free Delivery", "https://placehold.co/600x420/f1f5f9/0f172a?text=2-Door+Wardrobe", "2 doors • Mirror • Hanging space • Engineered wood", "🚪"}
        ,{"112", "Wooden Study Desk with Storage Shelves", "Furniture", "5499", "8499", "4.3", "1,108", "Easy Assembly", "https://placehold.co/600x420/f1f5f9/0f172a?text=Study+Desk", "Computer desk • Storage shelves • Engineered wood • Oak finish", "🪑"}
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
        p.put("specs", item[9]);
        p.put("emoji", item[10]);
        products.add(p);
    }

    String[] categories = {"All", "Mobiles", "Electronics", "Fashion", "Appliances", "Furniture"};
    String serverTimestamp = new java.text.SimpleDateFormat("dd MMM yyyy, hh:mm a").format(new Date());
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ShopKart | Deals you'll love</title>
<style>
    :root { --navy:#101827; --navy2:#1d2b40; --gold:#ffca55; --orange:#ff8a3d; --ink:#172033; --muted:#64748b; --surface:#fff; --bg:#f3f6fb; --green:#16834a; }
    * { box-sizing:border-box; margin:0; padding:0; font-family:Inter,Arial,Helvetica,sans-serif; }
    body { background:var(--bg); color:var(--ink); }
    button, input, select { font:inherit; }
    .navbar { background:var(--navy); color:#fff; display:flex; align-items:center; gap:18px; padding:12px 4%; position:sticky; top:0; z-index:50; box-shadow:0 4px 18px #0b122033; }
    .logo { color:#fff; text-decoration:none; font-size:26px; font-weight:900; letter-spacing:-1px; white-space:nowrap; }
    .logo span { color:var(--gold); }
    .location-box { font-size:11px; color:#cbd5e1; white-space:nowrap; }
    .location-box strong { display:block; color:#fff; font-size:13px; margin-top:3px; }
    .search-bar { display:flex; flex:1; min-width:180px; height:42px; border-radius:10px; overflow:hidden; background:#fff; }
    .search-bar select { border:0; background:#e9eef5; padding:0 10px; color:#334155; max-width:115px; }
    .search-bar input { flex:1; min-width:50px; border:0; outline:0; padding:0 14px; }
    .search-bar button { border:0; padding:0 18px; background:var(--gold); color:#242424; font-weight:800; cursor:pointer; }
    .nav-actions { display:flex; align-items:center; gap:16px; font-size:12px; white-space:nowrap; }
    .nav-item strong { display:block; font-size:13px; color:#fff; }
    .cart-btn { border:0; background:var(--navy2); color:#fff; padding:10px 13px; border-radius:9px; cursor:pointer; font-weight:800; }
    .cart-count { display:inline-block; background:var(--gold); color:#111; border-radius:20px; padding:2px 7px; margin-left:4px; }
    .subnav { display:flex; gap:8px; flex-wrap:wrap; padding:10px 4%; background:var(--navy2); }
    .subnav button { border:0; color:#e2e8f0; background:transparent; padding:7px 13px; border-radius:20px; cursor:pointer; }
    .subnav button:hover, .subnav button.active { background:var(--gold); color:#172033; font-weight:800; }
    .hero { margin:22px auto 18px; width:92%; max-width:1440px; min-height:220px; padding:32px 5%; border-radius:22px; color:#fff; display:flex; justify-content:space-between; align-items:center; gap:25px; overflow:hidden; background:radial-gradient(circle at 85% 20%,#ffb45466,transparent 28%),linear-gradient(120deg,#174ea6,#17243c 65%,#301c49); box-shadow:0 14px 35px #17203320; }
    .hero-tag { display:inline-block; background:var(--gold); color:#172033; padding:7px 12px; border-radius:30px; font-size:11px; font-weight:900; letter-spacing:1px; margin-bottom:13px; }
    .hero h1 { font-size:clamp(27px,4vw,43px); line-height:1.08; max-width:680px; margin-bottom:12px; }
    .hero p { color:#dbeafe; line-height:1.6; }
    .hero-art { font-size:82px; filter:drop-shadow(0 12px 18px #0005); animation:float 3s ease-in-out infinite; }
    @keyframes float { 0%,100%{transform:translateY(0) rotate(-4deg)} 50%{transform:translateY(-12px) rotate(4deg)} }
    .trust-strip { width:92%; max-width:1440px; margin:0 auto 24px; display:grid; grid-template-columns:repeat(3,1fr); gap:12px; }
    .trust-item { background:#fff; border:1px solid #e5eaf2; border-radius:12px; padding:13px; text-align:center; font-size:13px; color:#475569; }
    .trust-item strong { display:block; color:var(--ink); margin-bottom:3px; }
    .container { width:92%; max-width:1440px; margin:0 auto 50px; }
    .section-header { display:flex; justify-content:space-between; align-items:end; gap:12px; margin-bottom:17px; }
    .section-header h2 { font-size:25px; }
    .section-header p { color:var(--muted); font-size:13px; margin-top:4px; }
    #resultCount { color:var(--muted); font-size:13px; }
    .product-grid { display:grid; grid-template-columns:repeat(auto-fit,minmax(245px,1fr)); gap:18px; }
    .card { position:relative; background:var(--surface); border:1px solid #e7ebf2; border-radius:17px; padding:15px; display:flex; flex-direction:column; justify-content:space-between; min-height:440px; box-shadow:0 5px 18px #17203308; transition:transform .2s,box-shadow .2s; }
    .card:hover { transform:translateY(-5px); box-shadow:0 14px 30px #17203316; }
    .deal-label { position:absolute; top:12px; left:12px; z-index:1; background:#fff1e8; color:#c2410c; border-radius:20px; padding:5px 9px; font-size:10px; font-weight:900; }
    .product-emoji { position:absolute; right:14px; top:12px; font-size:22px; }
    .card img { width:100%; height:175px; object-fit:contain; margin:18px 0 12px; }
    .card-category { color:#64748b; font-size:10px; font-weight:900; letter-spacing:1px; text-transform:uppercase; margin-bottom:7px; }
    .card-title { font-size:15px; font-weight:800; line-height:1.4; min-height:42px; margin-bottom:8px; }
    .specs { color:#64748b; font-size:11px; line-height:1.5; min-height:34px; margin-bottom:9px; }
    .rating-row { display:flex; align-items:center; gap:7px; font-size:12px; color:#64748b; margin-bottom:10px; }
    .rating-badge { background:var(--green); color:#fff; padding:4px 7px; border-radius:6px; font-weight:900; }
    .price-row { margin-bottom:7px; display:flex; align-items:baseline; flex-wrap:wrap; gap:6px; }
    .price { font-size:22px; font-weight:900; color:#111827; }
    .mrp { font-size:12px; color:#94a3b8; text-decoration:line-through; }
    .discount { font-size:12px; color:var(--green); font-weight:900; }
    .saving { color:var(--green); font-size:11px; margin-bottom:9px; }
    .delivery-badge { color:var(--green); font-size:11px; font-weight:800; margin-bottom:13px; }
    .btn-group { display:flex; gap:8px; }
    .btn-cart,.btn-buy { flex:1; border:0; border-radius:9px; padding:10px 7px; font-weight:900; font-size:12px; cursor:pointer; transition:filter .2s; }
    .btn-cart { background:#fff0c2; color:#5b3b00; }
    .btn-buy { background:var(--orange); color:#fff; }
    .btn-cart:hover,.btn-buy:hover { filter:brightness(.95); }
    .empty-state { display:none; grid-column:1/-1; padding:45px 20px; background:#fff; border-radius:15px; text-align:center; color:var(--muted); }
    .cart-overlay { display:none; position:fixed; inset:0; background:#0f172a66; z-index:80; }
    .cart-overlay.show { display:block; }
    .cart-drawer { position:fixed; top:0; right:-420px; width:min(390px,100%); height:100vh; background:#fff; box-shadow:-8px 0 30px #0002; transition:right .25s; z-index:90; display:flex; flex-direction:column; }
    .cart-drawer.open { right:0; }
    .cart-header { background:var(--navy); color:#fff; padding:18px; display:flex; justify-content:space-between; align-items:center; }
    .cart-header button { background:none; border:0; color:#fff; font-size:25px; cursor:pointer; }
    .cart-items { flex:1; overflow-y:auto; padding:16px; }
    .cart-item { display:flex; justify-content:space-between; gap:12px; border-bottom:1px solid #e5e7eb; padding:13px 0; font-size:13px; }
    .cart-footer { padding:17px; border-top:1px solid #e5e7eb; background:#f8fafc; }
    .checkout-btn { width:100%; margin-top:12px; border:0; background:var(--gold); padding:13px; font-weight:900; border-radius:9px; cursor:pointer; }
    footer { background:var(--navy); color:#cbd5e1; text-align:center; padding:25px 15px; font-size:12px; line-height:1.8; }
    @media(max-width:850px) { .navbar{flex-wrap:wrap}.search-bar{order:3;flex-basis:100%}.nav-actions{margin-left:auto}.location-box{display:none}.hero{padding:27px}.hero-art{font-size:58px} }
    @media(max-width:520px) { .nav-actions .nav-item{display:none}.hero{align-items:flex-start}.hero-art{font-size:42px}.trust-strip{grid-template-columns:1fr}.section-header{align-items:flex-start;flex-direction:column}.product-grid{grid-template-columns:1fr 1fr;gap:10px}.card{padding:11px;min-height:420px}.card img{height:130px}.card-title{font-size:13px}.price{font-size:18px}.btn-group{flex-direction:column} }
</style>
</head>
<body>
<header class="navbar">
    <a href="index.jsp" class="logo">Shop<span>Kart</span> ✦</a>
    <div class="location-box">Delivering to<strong>📍 Bengaluru, India</strong></div>
    <div class="search-bar">
        <select id="categorySelect" onchange="filterProducts()">
            <% for (String cat : categories) { %><option value="<%= cat %>"><%= cat %></option><% } %>
        </select>
        <input type="text" id="searchInput" placeholder="Search mobiles, laptops, shoes, furniture..." oninput="filterProducts()">
        <button type="button" onclick="filterProducts()">Search 🔎</button>
    </div>
    <div class="nav-actions">
        <div class="nav-item">Welcome<strong>Account &amp; Lists</strong></div>
        <div class="nav-item">Your<strong>Orders</strong></div>
        <button class="cart-btn" type="button" onclick="toggleCart()">🛒 Cart <span class="cart-count" id="cartCount">0</span></button>
    </div>
</header>

<nav class="subnav" id="categoryTabs">
    <% for (String cat : categories) { %>
        <button type="button" class="<%= cat.equals("All") ? "active" : "" %>" onclick="selectCategory('<%= cat %>', this)"><%= cat.equals("All") ? "✨ " : "" %><%= cat %></button>
    <% } %>
</nav>

<section class="hero">
    <div>
        <span class="hero-tag">⚡ BIG SAVING DAYS</span>
        <h1>Good products.<br>Better prices.</h1>
        <p>Discover trending tech, everyday essentials, stylish furniture and deals worth adding to cart.</p>
        <p style="margin-top:12px;font-weight:800;color:#ffdf91;">💳 No Cost EMI &nbsp; • &nbsp; 🚚 Delivery offers &nbsp; • &nbsp; 🔒 Secure demo checkout</p>
    </div>
    <div class="hero-art" aria-hidden="true">🛍️</div>
</section>

<section class="trust-strip">
    <div class="trust-item"><strong>🚚 Delivery updates</strong>Delivery information shown on each product</div>
    <div class="trust-item"><strong>💳 Easy payments</strong>Demo pricing and EMI highlights</div>
    <div class="trust-item"><strong>⭐ Customer ratings</strong>Ratings and review counts in product cards</div>
</section>

<main class="container">
    <div class="section-header">
        <div><h2 id="sectionTitle">✨ Featured Deals</h2><p>Hand-picked products across popular categories</p></div>
        <span id="resultCount"><%= products.size() %> products available</span>
    </div>
    <div class="product-grid" id="productGrid">
        <% for (Map<String, String> p : products) {
            int price = Integer.parseInt(p.get("price"));
            int mrp = Integer.parseInt(p.get("mrp"));
            int discountPercent = (int)Math.round(((mrp - price) * 100.0) / mrp);
            int savings = mrp - price;
        %>
        <article class="card product-card" data-category="<%= p.get("category") %>" data-name="<%= p.get("name").toLowerCase() %>">
            <div class="deal-label"><%= p.get("badge") %></div>
            <span class="product-emoji"><%= p.get("emoji") %></span>
            <div>
                <img src="<%= p.get("img") %>" alt="<%= p.get("name") %>" loading="lazy">
                <div class="card-category"><%= p.get("category") %></div>
                <div class="card-title"><%= p.get("name") %></div>
                <div class="specs">⚙️ <%= p.get("specs") %></div>
                <div class="rating-row"><span class="rating-badge"><%= p.get("rating") %> ★</span><span><%= p.get("reviews") %> ratings</span></div>
                <div class="price-row">
                    <span class="price">₹<%= String.format("%,d", price) %></span>
                    <span class="mrp">₹<%= String.format("%,d", mrp) %></span>
                    <span class="discount"><%= discountPercent %>% OFF</span>
                </div>
                <div class="saving">You save ₹<%= String.format("%,d", savings) %></div>
                <div class="delivery-badge">✓ <%= p.get("badge") %></div>
            </div>
            <div class="btn-group">
                <button class="btn-cart" type="button" onclick="addToCart('<%= p.get("id") %>', this)">🛒 Add to Cart</button>
                <button class="btn-buy" type="button" onclick="buyNow('<%= p.get("name").replace("'", "\\'") %>', <%= price %>)">Buy Now ⚡</button>
            </div>
        </article>
        <% } %>
        <div class="empty-state" id="emptyState"><div style="font-size:35px">🔎</div><strong>No products found</strong><p>Try another product name or category.</p></div>
    </div>
</main>

<div class="cart-overlay" id="cartOverlay" onclick="toggleCart()"></div>
<aside class="cart-drawer" id="cartDrawer" aria-label="Shopping cart">
    <div class="cart-header"><h3>🛒 Your Shopping Cart</h3><button type="button" onclick="toggleCart()" aria-label="Close cart">&times;</button></div>
    <div class="cart-items" id="cartItemsList"><p style="color:#64748b;text-align:center;margin-top:40px;">Your cart is empty. Add something you like!</p></div>
    <div class="cart-footer">
        <div style="display:flex;justify-content:space-between;font-weight:900;font-size:16px;"><span>Subtotal</span><span id="cartTotal">₹0</span></div>
        <button class="checkout-btn" type="button" onclick="checkout()">Proceed to Checkout →</button>
        <p style="font-size:10px;color:#64748b;margin-top:8px;">Demo storefront only. No real payment or order is processed.</p>
    </div>
</aside>

<footer>
    <strong>ShopKart ✦</strong><br>
    Demo e-commerce storefront built with JSP, Java, HTML, CSS and JavaScript.<br>
    Server: <%= application.getServerInfo() %> &nbsp; | &nbsp; Page generated: <%= serverTimestamp %><br>
    © 2026 ShopKart. Product details and prices are sample data.
</footer>

<script>
    const cart = [];

    function selectCategory(category, button) {
        document.getElementById("categorySelect").value = category;
        document.querySelectorAll("#categoryTabs button").forEach(el => el.classList.remove("active"));
        button.classList.add("active");
        filterProducts();
    }

    function filterProducts() {
        const category = document.getElementById("categorySelect").value;
        const query = document.getElementById("searchInput").value.toLowerCase().trim();
        const cards = document.querySelectorAll(".product-card");
        let visible = 0;

        cards.forEach(card => {
            const categoryMatch = category === "All" || card.dataset.category === category;
            const nameMatch = card.dataset.name.includes(query);
            const show = categoryMatch && nameMatch;
            card.style.display = show ? "flex" : "none";
            if (show) visible++;
        });

        document.getElementById("sectionTitle").textContent =
            (category === "All" ? "✨ Featured Deals" : "🛍️ " + category + " Deals");
        document.getElementById("resultCount").textContent = visible + (visible === 1 ? " product available" : " products available");
        document.getElementById("emptyState").style.display = visible === 0 ? "block" : "none";

        document.querySelectorAll("#categoryTabs button").forEach(button => {
            button.classList.toggle("active", button.textContent.trim().replace("✨ ", "") === category);
        });
    }

    function addToCart(id, button) {
        const card = button.closest(".product-card");
        const name = card.querySelector(".card-title").textContent;
        const priceText = card.querySelector(".price").textContent.replace(/[₹,]/g, "");
        const price = Number(priceText);
        const existing = cart.find(item => item.id === id);

        if (existing) existing.qty++;
        else cart.push({ id, name, price, qty: 1 });

        renderCart();
        button.textContent = "✓ Added";
        window.setTimeout(() => button.textContent = "🛒 Add to Cart", 900);
    }

    function removeFromCart(id) {
        const index = cart.findIndex(item => item.id === id);
        if (index !== -1) cart.splice(index, 1);
        renderCart();
    }

    function renderCart() {
        const list = document.getElementById("cartItemsList");
        const countBadge = document.getElementById("cartCount");
        const totalEl = document.getElementById("cartTotal");
        const totalQty = cart.reduce((sum, item) => sum + item.qty, 0);
        const totalPrice = cart.reduce((sum, item) => sum + item.price * item.qty, 0);

        countBadge.textContent = totalQty;
        totalEl.textContent = "₹" + totalPrice.toLocaleString("en-IN");

        if (cart.length === 0) {
            list.innerHTML = '<p style="color:#64748b;text-align:center;margin-top:40px;">Your cart is empty. Add something you like!</p>';
            return;
        }

        list.innerHTML = cart.map(item =>
            '<div class="cart-item"><div><strong>' + escapeHtml(item.name) + '</strong><div style="color:#64748b;margin-top:5px;">₹' +
            item.price.toLocaleString("en-IN") + ' × ' + item.qty + '</div></div><button type="button" onclick="removeFromCart(\'' +
            item.id + '\')" style="border:0;background:none;color:#dc2626;cursor:pointer;">Remove</button></div>'
        ).join("");
    }

    function escapeHtml(value) {
        return value.replace(/[&<>"']/g, char => ({
            "&":"&amp;", "<":"&lt;", ">":"&gt;", '"':"&quot;", "'":"&#39;"
        })[char]);
    }

    function toggleCart() {
        document.getElementById("cartDrawer").classList.toggle("open");
        document.getElementById("cartOverlay").classList.toggle("show");
    }

    function buyNow(name, price) {
        alert("Demo checkout\n\n" + name + "\nTotal: ₹" + price.toLocaleString("en-IN") +
              "\n\nThis sample page does not process real payments.");
    }

    function checkout() {
        if (cart.length === 0) {
            alert("Your cart is empty.");
            return;
        }
        const total = cart.reduce((sum, item) => sum + item.price * item.qty, 0);
        alert("Demo order summary\nItems: " + cart.reduce((sum, item) => sum + item.qty, 0) +
              "\nTotal: ₹" + total.toLocaleString("en-IN") +
              "\n\nNo real order or payment has been created.");
        cart.length = 0;
        renderCart();
        toggleCart();
    }
</script>
</body>
</html>

