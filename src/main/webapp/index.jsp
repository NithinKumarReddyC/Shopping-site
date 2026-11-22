<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    List<Map<String, String>> products = new ArrayList<>();

    // id, name, category, price, mrp, rating, reviews, badge, image, specs, emoji
    String[][] catalogData = {
        // ── Mobiles ──
        {"101", "Apple iPhone 16 (128 GB) - Ultramarine", "Mobiles", "79900", "89900", "4.6", "14,230", "Free Delivery by Tomorrow", "images/iphone-16.svg", "128 GB • A18 chip • 48 MP camera • 6.1-inch display", "📱"},
        {"102", "Samsung Galaxy S24 Ultra 5G (Titanium Gray, 256 GB)", "Mobiles", "119999", "134999", "4.7", "8,912", "Assured Delivery • No Cost EMI", "images/galaxy-s24-ultra.svg", "256 GB • Snapdragon 8 Gen 3 • 200 MP camera • S Pen", "📱"},
        {"113", "Google Pixel 9 Pro (128 GB) - Obsidian", "Mobiles", "109999", "119999", "4.5", "3,580", "No Cost EMI • Free Delivery", "images/pixel-9-pro.svg", "128 GB • Tensor G4 • 50 MP camera • 6.3-inch display", "📱"},
        {"114", "OnePlus 13 5G (256 GB) - Midnight Ocean", "Mobiles", "69999", "79999", "4.4", "5,210", "Exchange Offer Available", "images/oneplus-13.svg", "256 GB • Snapdragon 8 Elite • 50 MP camera • 6.82-inch display", "📱"},
        // ── Electronics ──
        {"103", "ASUS Vivobook 15, Intel Core i5-1335U", "Electronics", "54990", "69990", "4.3", "3,410", "No Cost EMI Available", "images/asus-vivobook.svg", "Core i5 • 16 GB RAM • 512 GB SSD • 15.6-inch display", "💻"},
        {"104", "Sony WH-1000XM5 Wireless Noise Cancelling Headphones", "Electronics", "26990", "34990", "4.8", "6,105", "Best Seller", "images/sony-wh1000xm5.svg", "Wireless • Active noise cancellation • 30-hour battery", "🎧"},
        {"115", "Apple MacBook Air M3 (8 GB/256 GB SSD)", "Electronics", "99990", "114900", "4.8", "2,870", "Student Offer • No Cost EMI", "images/macbook-air.svg", "M3 chip • 8 GB RAM • 256 GB SSD • 13.6-inch Liquid Retina", "💻"},
        {"116", "Samsung Galaxy Tab S9 FE (128 GB) Wi-Fi", "Electronics", "30999", "44999", "4.4", "1,950", "Great Deal", "images/galaxy-tab.svg", "128 GB • Exynos 1380 • 10.9-inch • S Pen included", "📲"},
        {"118", "boAt Rockerz 550 Bluetooth Headphones", "Electronics", "1799", "4490", "4.1", "45,320", "Top Rated", "images/boat-rockerz.svg", "Bluetooth 5.0 • 20-hour battery • 50mm drivers • Foldable", "🎧"},
        {"122", "Noise ColorFit Pro 5 Max Smartwatch", "Electronics", "3499", "5999", "4.2", "12,780", "Trending Now", "images/smartwatch.svg", "1.96-inch AMOLED • Bluetooth calling • 100+ sports modes", "⌚"},
        // ── Fashion ──
        {"105", "Nike Revolution 7 Running Shoes for Men", "Fashion", "3295", "3695", "4.2", "1,890", "Free Delivery", "images/nike-shoes.svg", "Road running • Lightweight • Cushioned sole", "👟"},
        {"106", "Allen Solly Men's Regular Fit Cotton Polo T-Shirt", "Fashion", "699", "1199", "4.1", "22,450", "Top Deal", "images/polo-tshirt.svg", "Cotton blend • Regular fit • Casual wear", "👕"},
        {"117", "Levi's 511 Slim Fit Men's Jeans (Blue)", "Fashion", "1899", "3999", "4.3", "8,340", "52% OFF • Best Price", "images/levis-jeans.svg", "Slim fit • Stretchable • Mid-rise • Cotton blend", "👖"},
        // ── Appliances ──
        {"107", "Philips Digital Air Fryer HD9252/90", "Appliances", "7999", "11995", "4.5", "9,870", "1 Year Warranty", "images/air-fryer.svg", "4.1 L capacity • Rapid Air technology • Digital controls", "🍟"},
        {"108", "LG 260 L 3 Star Frost-Free Double Door Refrigerator", "Appliances", "24490", "31990", "4.4", "5,320", "Free Installation", "images/lg-refrigerator.svg", "260 L capacity • 3 Star rating • Frost-free • Double door", "🧊"},
        {"119", "Samsung 7 kg Fully-Automatic Front Load Washing Machine", "Appliances", "29990", "38990", "4.3", "3,780", "Free Installation • Exchange", "images/washing-machine.svg", "7 kg • Front load • Hygiene Steam • Digital Inverter", "🫧"},
        {"120", "IFB 25 L Convection Microwave Oven", "Appliances", "12490", "16990", "4.5", "7,210", "Best Seller", "images/microwave.svg", "25 L • Convection • 300+ auto-cook menus • Starter kit", "♨️"},
        // ── Furniture ──
        {"109", "Wakefit 3-Seater Fabric Sofa", "Furniture", "24999", "34999", "4.4", "1,245", "Free Delivery • 3 Year Warranty", "images/sofa-3seater.svg", "3-seater • Fabric upholstery • Solid wood frame • Grey", "🛋️"},
        {"110", "Queen Size Engineered Wood Bed with Storage", "Furniture", "18999", "27999", "4.2", "986", "Free Installation", "images/queen-bed.svg", "Queen size • Hydraulic storage • Engineered wood • Walnut finish", "🛏️"},
        {"111", "2-Door Wardrobe with Mirror", "Furniture", "12999", "19999", "4.1", "754", "Free Delivery", "images/wardrobe.svg", "2 doors • Mirror • Hanging space • Engineered wood", "🚪"},
        {"112", "Wooden Study Desk with Storage Shelves", "Furniture", "5499", "8499", "4.3", "1,108", "Easy Assembly", "images/study-desk.svg", "Computer desk • Storage shelves • Engineered wood • Oak finish", "🪑"},
        {"121", "Green Soul Jupiter Ergonomic Office Chair", "Furniture", "13999", "22999", "4.5", "2,340", "Best Seller", "images/office-chair.svg", "Ergonomic • Adjustable lumbar • Mesh back • Armrests", "💺"},
        // ── Grocery ──
        {"130", "India Gate Basmati Rice Feast Rozzana (5 kg)", "Grocery", "429", "599", "4.6", "29,800", "Free Delivery • Top Deal", "images/rice.gif", "5 kg bag • Aged fragrant long grain • 100% Pure Basmati", "🍚"},
        {"131", "Amul Gold Fresh Whole Milk (1 L Pack)", "Grocery", "68", "74", "4.7", "41,200", "Daily Morning Essential", "images/milk.gif", "1 Litre pack • Full cream 6% fat • Pasteurized & Homogenized", "🥛"},
        {"132", "Farm Fresh Organic Brown Eggs (Pack of 12)", "Grocery", "119", "150", "4.7", "18,400", "High Protein • Farm Fresh", "images/eggs.gif", "12 pcs • Free-range antibiotic-free eggs • Naturally nutritious", "🥚"},
        {"133", "Harvest Gold 100% Atta Whole Wheat Bread (400g)", "Grocery", "45", "50", "4.4", "12,600", "Freshly Baked Today", "images/bread.gif", "400 g loaf • 0% Maida • Zero trans fat • Soft & healthy", "🍞"},
        {"134", "Fortune Sunlite Refined Sunflower Oil (1 L Pouch)", "Grocery", "135", "175", "4.5", "23,100", "Great Indian Grocery Deal", "images/sunflower-oil.gif", "1 Litre pouch • Rich in Vitamin E • Low absorb technology", "🌻"},
        {"135", "Aashirvaad Superior MP Sharbati Atta (10 kg)", "Grocery", "445", "515", "4.8", "62,400", "100% Whole Wheat • Best Seller", "images/atta.gif", "10 kg bag • 0% Maida • Rich dietary fibre • Extra soft rotis", "🌾"},
        {"136", "Tata Tea Gold Care Premium Tea (500 g)", "Grocery", "310", "390", "4.6", "17,800", "With 5 Natural Ingredients", "images/tea.gif", "500 g pouch • Tulsi, Ginger, Cardamom, Mulethi & Brahmi", "☕"},
        {"137", "Cadbury Dairy Milk Silk Chocolate Bar (150 g)", "Grocery", "165", "185", "4.8", "45,900", "Sweet Treat • Top Rated", "images/chocolate.gif", "150 g bar • Premium creamy & smooth milk chocolate", "🍫"}
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

    String[] categories = {"All", "Mobiles", "Electronics", "Fashion", "Appliances", "Furniture", "Grocery"};
    String serverTimestamp = new java.text.SimpleDateFormat("dd MMM yyyy, hh:mm a").format(new Date());
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ShopKart | Deals you'll love</title>
<style>
    /* ===== VARIABLES ===== */
    :root {
        --navy: #101827; --navy2: #1d2b40; --gold: #ffca55; --orange: #ff8a3d;
        --ink: #172033; --muted: #64748b; --surface: #fff; --bg: #f3f6fb;
        --green: #16834a; --radius: 16px; --shadow: 0 5px 18px #17203310;
    }

    /* ===== RESET ===== */
    * { box-sizing: border-box; margin: 0; padding: 0; }
    html { scroll-behavior: smooth; -webkit-text-size-adjust: 100%; }
    body { background: var(--bg); color: var(--ink); font-family: 'Segoe UI', Inter, Arial, Helvetica, sans-serif; line-height: 1.5; }
    button, input, select { font: inherit; }
    img { max-width: 100%; height: auto; }

    /* ===== NAVBAR ===== */
    .navbar {
        background: var(--navy); color: #fff; display: flex; align-items: center;
        gap: 16px; padding: 12px 4%; position: sticky; top: 0; z-index: 50;
        box-shadow: 0 4px 18px #0b122033;
    }
    .logo { color: #fff; text-decoration: none; font-size: 26px; font-weight: 900; letter-spacing: -1px; white-space: nowrap; flex-shrink: 0; }
    .logo span { color: var(--gold); }
    .location-box { font-size: 11px; color: #cbd5e1; white-space: nowrap; flex-shrink: 0; }
    .location-box strong { display: block; color: #fff; font-size: 13px; margin-top: 3px; }
    .search-bar { display: flex; flex: 1; min-width: 0; height: 42px; border-radius: 10px; overflow: hidden; background: #fff; }
    .search-bar select { border: 0; background: #e9eef5; padding: 0 10px; color: #334155; max-width: 115px; cursor: pointer; }
    .search-bar input { flex: 1; min-width: 0; border: 0; outline: 0; padding: 0 14px; font-size: 14px; }
    .search-bar button { border: 0; padding: 0 16px; background: var(--gold); color: #242424; font-weight: 800; cursor: pointer; white-space: nowrap; transition: background .2s; }
    .search-bar button:hover { background: #ffd97a; }
    .nav-actions { display: flex; align-items: center; gap: 16px; font-size: 12px; white-space: nowrap; flex-shrink: 0; }
    .nav-item { color: #cbd5e1; }
    .nav-item strong { display: block; font-size: 13px; color: #fff; }
    .cart-btn {
        border: 0; background: var(--navy2); color: #fff; padding: 10px 14px;
        border-radius: 9px; cursor: pointer; font-weight: 800; transition: background .2s;
        display: flex; align-items: center; gap: 6px;
    }
    .cart-btn:hover { background: #2a3b55; }
    .cart-count { display: inline-block; background: var(--gold); color: #111; border-radius: 20px; padding: 2px 7px; font-size: 11px; font-weight: 900; min-width: 22px; text-align: center; }

    /* ===== SUB-NAV (Category Tabs) ===== */
    .subnav { display: flex; gap: 6px; flex-wrap: wrap; padding: 10px 4%; background: var(--navy2); }
    .subnav button {
        border: 0; color: #e2e8f0; background: transparent; padding: 8px 16px;
        border-radius: 20px; cursor: pointer; font-size: 13px; font-weight: 600;
        transition: all .2s; white-space: nowrap;
    }
    .subnav button:hover { background: rgba(255,202,85,0.15); color: #fff; }
    .subnav button.active { background: var(--gold); color: #172033; font-weight: 800; }

    /* ===== HERO BANNER ===== */
    .hero {
        margin: 22px auto 20px; width: 92%; max-width: 1440px; min-height: 220px;
        padding: 36px 5%; border-radius: var(--radius); color: #fff;
        display: flex; justify-content: space-between; align-items: center; gap: 30px; overflow: hidden;
        background: radial-gradient(circle at 85% 20%, #ffb45466, transparent 28%),
                    linear-gradient(120deg, #174ea6, #17243c 65%, #301c49);
        box-shadow: 0 14px 35px #17203320;
    }
    .hero-tag { display: inline-block; background: var(--gold); color: #172033; padding: 7px 14px; border-radius: 30px; font-size: 11px; font-weight: 900; letter-spacing: 1px; margin-bottom: 14px; }
    .hero h1 { font-size: clamp(24px, 4vw, 43px); line-height: 1.1; max-width: 680px; margin-bottom: 14px; }
    .hero p { color: #dbeafe; line-height: 1.6; max-width: 600px; }
    .hero-features { margin-top: 14px; font-weight: 800; color: #ffdf91; font-size: 14px; }
    .hero-art { font-size: 82px; filter: drop-shadow(0 12px 18px #0005); animation: float 3s ease-in-out infinite; flex-shrink: 0; }
    @keyframes float { 0%,100%{ transform: translateY(0) rotate(-4deg) } 50%{ transform: translateY(-12px) rotate(4deg) } }

    /* ===== TRUST STRIP ===== */
    .trust-strip { width: 92%; max-width: 1440px; margin: 0 auto 24px; display: grid; grid-template-columns: repeat(3, 1fr); gap: 12px; }
    .trust-item {
        background: #fff; border: 1px solid #e5eaf2; border-radius: 12px;
        padding: 14px; text-align: center; font-size: 13px; color: #475569;
        transition: transform .2s, box-shadow .2s;
    }
    .trust-item:hover { transform: translateY(-2px); box-shadow: var(--shadow); }
    .trust-item strong { display: block; color: var(--ink); margin-bottom: 4px; }

    /* ===== MAIN CONTAINER ===== */
    .container { width: 92%; max-width: 1440px; margin: 0 auto 50px; }
    .section-header { display: flex; justify-content: space-between; align-items: end; gap: 12px; margin-bottom: 20px; flex-wrap: wrap; }
    .section-header h2 { font-size: 25px; }
    .section-header p { color: var(--muted); font-size: 13px; margin-top: 4px; }
    #resultCount { color: var(--muted); font-size: 13px; white-space: nowrap; }

    /* ===== PRODUCT GRID ===== */
    .product-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(260px, 1fr));
        gap: 20px;
    }

    /* ===== PRODUCT CARD ===== */
    .card {
        position: relative; background: var(--surface); border: 1px solid #e7ebf2;
        border-radius: var(--radius); padding: 16px; display: flex; flex-direction: column;
        justify-content: space-between; min-height: 460px;
        box-shadow: var(--shadow); transition: transform .25s ease, box-shadow .25s ease;
    }
    .card:hover { transform: translateY(-6px); box-shadow: 0 16px 40px #17203318; }
    .deal-label {
        position: absolute; top: 12px; left: 12px; z-index: 1;
        background: #fff1e8; color: #c2410c; border-radius: 20px;
        padding: 5px 10px; font-size: 10px; font-weight: 900; letter-spacing: 0.3px;
    }
    .product-emoji { position: absolute; right: 14px; top: 12px; font-size: 20px; }
    .card-img-wrap {
        width: 100%; height: 185px; border-radius: 10px; overflow: hidden;
        margin-bottom: 12px; background: #f8fafc;
    }
    .card-img-wrap img { width: 100%; height: 100%; object-fit: cover; transition: transform .3s; }
    .card:hover .card-img-wrap img { transform: scale(1.04); }
    .card-category { color: #64748b; font-size: 10px; font-weight: 900; letter-spacing: 1px; text-transform: uppercase; margin-bottom: 6px; }
    .card-title { font-size: 14px; font-weight: 800; line-height: 1.4; min-height: 40px; margin-bottom: 6px; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden; }
    .specs { color: #64748b; font-size: 11px; line-height: 1.5; min-height: 32px; margin-bottom: 8px; }
    .rating-row { display: flex; align-items: center; gap: 7px; font-size: 12px; color: #64748b; margin-bottom: 10px; }
    .rating-badge { background: var(--green); color: #fff; padding: 3px 7px; border-radius: 6px; font-weight: 900; font-size: 11px; }
    .price-row { margin-bottom: 6px; display: flex; align-items: baseline; flex-wrap: wrap; gap: 6px; }
    .price { font-size: 22px; font-weight: 900; color: #111827; }
    .mrp { font-size: 12px; color: #94a3b8; text-decoration: line-through; }
    .discount { font-size: 12px; color: var(--green); font-weight: 900; }
    .saving { color: var(--green); font-size: 11px; margin-bottom: 8px; }
    .delivery-badge { color: var(--green); font-size: 11px; font-weight: 800; margin-bottom: 12px; }
    .btn-group { display: flex; gap: 8px; margin-top: auto; }
    .btn-cart, .btn-buy {
        flex: 1; border: 0; border-radius: 10px; padding: 11px 8px;
        font-weight: 900; font-size: 12px; cursor: pointer;
        transition: filter .2s, transform .15s; min-height: 44px;
    }
    .btn-cart { background: #fff0c2; color: #5b3b00; }
    .btn-buy { background: var(--orange); color: #fff; }
    .btn-cart:hover, .btn-buy:hover { filter: brightness(.93); }
    .btn-cart:active, .btn-buy:active { transform: scale(0.97); }

    /* ===== EMPTY STATE ===== */
    .empty-state { display: none; grid-column: 1 / -1; padding: 50px 20px; background: #fff; border-radius: var(--radius); text-align: center; color: var(--muted); }

    /* ===== CART OVERLAY & DRAWER ===== */
    .cart-overlay { display: none; position: fixed; inset: 0; background: #0f172a66; z-index: 80; backdrop-filter: blur(2px); }
    .cart-overlay.show { display: block; }
    .cart-drawer {
        position: fixed; top: 0; right: -420px; width: min(400px, 90vw); height: 100vh;
        background: #fff; box-shadow: -8px 0 30px #0002; transition: right .3s ease;
        z-index: 90; display: flex; flex-direction: column;
    }
    .cart-drawer.open { right: 0; }
    .cart-header { background: var(--navy); color: #fff; padding: 18px 20px; display: flex; justify-content: space-between; align-items: center; }
    .cart-header h3 { font-size: 16px; }
    .cart-header button { background: none; border: 0; color: #fff; font-size: 28px; cursor: pointer; line-height: 1; padding: 4px; }
    .cart-items { flex: 1; overflow-y: auto; padding: 16px 20px; }
    .cart-item { display: flex; justify-content: space-between; align-items: flex-start; gap: 12px; border-bottom: 1px solid #e5e7eb; padding: 14px 0; font-size: 13px; }
    .cart-footer { padding: 18px 20px; border-top: 1px solid #e5e7eb; background: #f8fafc; }
    .checkout-btn {
        width: 100%; margin-top: 12px; border: 0; background: var(--gold);
        padding: 14px; font-weight: 900; font-size: 14px; border-radius: 10px;
        cursor: pointer; transition: background .2s; min-height: 48px;
    }
    .checkout-btn:hover { background: #ffd97a; }

    /* ===== SCROLL TO TOP ===== */
    .scroll-top {
        position: fixed; bottom: 30px; right: 30px; width: 48px; height: 48px;
        border-radius: 50%; border: 0; background: var(--navy); color: #fff;
        font-size: 20px; cursor: pointer; z-index: 60; opacity: 0;
        transform: translateY(20px); transition: opacity .3s, transform .3s;
        box-shadow: 0 4px 15px #0003; display: flex; align-items: center; justify-content: center;
    }
    .scroll-top.visible { opacity: 1; transform: translateY(0); }
    .scroll-top:hover { background: #2a3b55; }

    /* ===== FOOTER ===== */
    footer {
        background: var(--navy); color: #cbd5e1; text-align: center;
        padding: 30px 20px; font-size: 12px; line-height: 2;
    }
    footer strong { font-size: 16px; }
    .footer-links { display: flex; justify-content: center; gap: 20px; flex-wrap: wrap; margin: 10px 0; }
    .footer-links a { color: #94a3b8; text-decoration: none; font-size: 12px; transition: color .2s; }
    .footer-links a:hover { color: var(--gold); }

    /* ===== ANIMATIONS ===== */
    @keyframes fadeInUp { from { opacity: 0; transform: translateY(25px); } to { opacity: 1; transform: translateY(0); } }
    .card { animation: fadeInUp .5s ease both; }
    .card:nth-child(2) { animation-delay: .05s; }
    .card:nth-child(3) { animation-delay: .1s; }
    .card:nth-child(4) { animation-delay: .15s; }
    .card:nth-child(5) { animation-delay: .2s; }

    /* ===== RESPONSIVE: LARGE TABLET / SMALL DESKTOP ===== */
    @media (max-width: 1100px) {
        .product-grid { grid-template-columns: repeat(auto-fill, minmax(230px, 1fr)); gap: 16px; }
    }

    /* ===== RESPONSIVE: TABLET ===== */
    @media (max-width: 850px) {
        .navbar { flex-wrap: wrap; gap: 10px; padding: 10px 3%; }
        .search-bar { order: 3; flex-basis: 100%; }
        .nav-actions { margin-left: auto; }
        .location-box { display: none; }
        .hero { padding: 28px 5%; min-height: 180px; }
        .hero h1 { font-size: 26px; }
        .hero-art { font-size: 60px; }
        .trust-strip { grid-template-columns: repeat(3, 1fr); gap: 8px; }
        .trust-item { padding: 10px; font-size: 12px; }
    }

    /* ===== RESPONSIVE: LARGE PHONE ===== */
    @media (max-width: 650px) {
        .navbar { padding: 10px 3%; gap: 8px; }
        .logo { font-size: 22px; }
        .nav-actions .nav-item { display: none; }
        .hero { flex-direction: column; text-align: center; padding: 24px 5%; gap: 15px; }
        .hero-art { font-size: 50px; }
        .hero-features { font-size: 12px; }
        .trust-strip { grid-template-columns: 1fr; gap: 8px; }
        .section-header { flex-direction: column; align-items: flex-start; }
        .product-grid { grid-template-columns: repeat(2, 1fr); gap: 12px; }
        .card { padding: 12px; min-height: 400px; border-radius: 12px; }
        .card-img-wrap { height: 150px; border-radius: 8px; }
        .card-title { font-size: 13px; min-height: 36px; }
        .price { font-size: 18px; }
        .specs { font-size: 10px; min-height: 28px; }
        .btn-group { gap: 6px; }
        .btn-cart, .btn-buy { padding: 9px 6px; font-size: 11px; min-height: 40px; }
        .subnav { padding: 8px 3%; gap: 5px; }
        .subnav button { padding: 6px 12px; font-size: 12px; }
        footer { padding: 25px 15px; }
        .scroll-top { bottom: 20px; right: 20px; width: 42px; height: 42px; }
    }

    /* ===== RESPONSIVE: SMALL PHONE ===== */
    @media (max-width: 400px) {
        .navbar { padding: 8px 3%; }
        .logo { font-size: 20px; }
        .search-bar { height: 38px; }
        .search-bar select { max-width: 80px; font-size: 12px; padding: 0 6px; }
        .search-bar input { padding: 0 10px; font-size: 13px; }
        .search-bar button { padding: 0 10px; font-size: 12px; }
        .cart-btn { padding: 8px 10px; font-size: 12px; }
        .hero { padding: 20px 4%; min-height: auto; }
        .hero h1 { font-size: 22px; }
        .hero p { font-size: 13px; }
        .hero-art { font-size: 40px; }
        .product-grid { grid-template-columns: repeat(2, 1fr); gap: 8px; }
        .card { padding: 10px; min-height: 370px; }
        .card-img-wrap { height: 120px; }
        .card-title { font-size: 12px; min-height: 32px; }
        .card-category { font-size: 9px; }
        .price { font-size: 16px; }
        .mrp, .discount { font-size: 10px; }
        .saving { font-size: 10px; }
        .delivery-badge { font-size: 10px; }
        .rating-row { font-size: 10px; }
        .rating-badge { font-size: 10px; padding: 2px 5px; }
        .deal-label { font-size: 8px; padding: 3px 7px; top: 8px; left: 8px; }
        .product-emoji { font-size: 16px; top: 8px; right: 10px; }
        .btn-group { flex-direction: column; gap: 5px; }
        .btn-cart, .btn-buy { padding: 10px 6px; font-size: 11px; border-radius: 8px; }
        .section-header h2 { font-size: 20px; }
        .subnav { overflow-x: auto; flex-wrap: nowrap; -webkit-overflow-scrolling: touch; padding-bottom: 6px; }
        .subnav button { flex-shrink: 0; }
    }

    /* ===== RESPONSIVE: VERY SMALL ===== */
    @media (max-width: 340px) {
        .product-grid { grid-template-columns: 1fr; }
        .card { min-height: auto; }
        .card-img-wrap { height: 160px; }
    }
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
        <p class="hero-features">💳 No Cost EMI &nbsp; • &nbsp; 🚚 Free Delivery &nbsp; • &nbsp; 🔒 Secure Checkout &nbsp; • &nbsp; 🔄 Easy Returns</p>
    </div>
    <div class="hero-art" aria-hidden="true">🛍️</div>
</section>

<section class="trust-strip">
    <div class="trust-item"><strong>🚚 Fast Delivery</strong>Delivery info shown on every product</div>
    <div class="trust-item"><strong>💳 Easy Payments</strong>No Cost EMI &amp; multiple payment options</div>
    <div class="trust-item"><strong>⭐ Trusted Reviews</strong>Real ratings &amp; reviews from verified buyers</div>
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
                <div class="card-img-wrap">
                    <img src="<%= p.get("img") %>" alt="<%= p.get("name") %>" loading="lazy">
                </div>
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
                <button class="btn-buy" type="button" onclick="buyNow('<%= p.get("name").replace("\\", "\\\\").replace("'", "\\'") %>', <%= price %>)">Buy Now ⚡</button>
            </div>
        </article>
        <% } %>
        <div class="empty-state" id="emptyState"><div style="font-size:40px;margin-bottom:10px">🔎</div><strong style="font-size:16px">No products found</strong><p style="margin-top:6px">Try a different search term or category.</p></div>
    </div>
</main>

<div class="cart-overlay" id="cartOverlay" onclick="toggleCart()"></div>
<aside class="cart-drawer" id="cartDrawer" aria-label="Shopping cart">
    <div class="cart-header"><h3>🛒 Your Shopping Cart</h3><button type="button" onclick="toggleCart()" aria-label="Close cart">&times;</button></div>
    <div class="cart-items" id="cartItemsList"><p style="color:#64748b;text-align:center;margin-top:40px;">Your cart is empty. Add something you like!</p></div>
    <div class="cart-footer">
        <div style="display:flex;justify-content:space-between;font-weight:900;font-size:16px;"><span>Subtotal</span><span id="cartTotal">₹0</span></div>
        <button class="checkout-btn" type="button" onclick="checkout()">Proceed to Checkout →</button>
        <p style="font-size:10px;color:#64748b;margin-top:8px;text-align:center;">Demo storefront only. No real payment or order is processed.</p>
    </div>
</aside>

<button class="scroll-top" id="scrollTop" type="button" onclick="window.scrollTo({top:0})" aria-label="Scroll to top">↑</button>

<footer>
    <strong>ShopKart ✦</strong><br>
    <div class="footer-links">
        <a href="#">About</a><a href="#">Contact</a><a href="#">Careers</a>
        <a href="#">Help Center</a><a href="#">Privacy Policy</a><a href="#">Terms</a>
    </div>
    Demo e-commerce storefront built with JSP, Java, HTML, CSS and JavaScript.<br>
    Server: <%= application.getServerInfo() %> &nbsp; | &nbsp; Page generated: <%= serverTimestamp %><br>
    &copy; 2026 ShopKart. Product details and prices are sample data.
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

        cards.forEach((card, i) => {
            const categoryMatch = category === "All" || card.dataset.category === category;
            const nameMatch = card.dataset.name.includes(query);
            const show = categoryMatch && nameMatch;
            card.style.display = show ? "flex" : "none";
            if (show) {
                card.style.animationDelay = (visible * 0.04) + "s";
                visible++;
            }
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
        button.style.background = "#d1fae5";
        button.style.color = "#065f46";
        window.setTimeout(() => {
            button.textContent = "🛒 Add to Cart";
            button.style.background = "";
            button.style.color = "";
        }, 1000);
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
            item.price.toLocaleString("en-IN") + ' &times; ' + item.qty + ' = <strong>₹' +
            (item.price * item.qty).toLocaleString("en-IN") + '</strong></div></div><button type="button" onclick="removeFromCart(\'' +
            item.id + '\')" style="border:0;background:#fee2e2;color:#dc2626;cursor:pointer;border-radius:6px;padding:4px 10px;font-size:12px;font-weight:700;white-space:nowrap;align-self:center;">Remove</button></div>'
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
        document.body.style.overflow = document.getElementById("cartDrawer").classList.contains("open") ? "hidden" : "";
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

    // Scroll to top button visibility
    window.addEventListener("scroll", function() {
        document.getElementById("scrollTop").classList.toggle("visible", window.scrollY > 400);
    });
</script>
</body>
</html>
