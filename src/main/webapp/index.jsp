<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    // Each row: {id, name, category, price, mrp, rating, reviews, badge, imageUrl}
    String[][] products = {
        {"101", "Apple iPhone 16 (128 GB) - Ultramarine", "Mobiles", "79900", "89900", "4.6", "14,230", "Free Delivery by Tomorrow", "https://placehold.co/300x300/f8fafc/1e293b?text=iPhone+16"},
        {"102", "Samsung Galaxy S24 Ultra 5G (Titanium Gray, 256 GB)", "Mobiles", "119999", "134999", "4.7", "8,912", "Assured | Free Delivery", "https://placehold.co/300x300/f8fafc/1e293b?text=Galaxy+S24+Ultra"},
        {"103", "ASUS Vivobook 15, Intel Core i5-1335U, 16GB RAM, 512GB SSD", "Electronics", "54990", "69990", "4.3", "3,410", "No Cost EMI Available", "https://placehold.co/300x300/f8fafc/1e293b?text=ASUS+Vivobook+15"},
        {"104", "Sony WH-1000XM5 Wireless Noise Cancelling Headphones", "Electronics", "26990", "34990", "4.8", "6,105", "Best Seller", "https://placehold.co/300x300/f8fafc/1e293b?text=Sony+WH-1000XM5"},
        {"105", "Nike Revolution 7 Running Shoes for Men (Black/White)", "Fashion", "3295", "3695", "4.2", "1,890", "Free Delivery", "https://placehold.co/300x300/f8fafc/1e293b?text=Nike+Shoes"},
        {"106", "Allen Solly Men's Regular Fit Cotton Polo T-Shirt", "Fashion", "699", "1199", "4.1", "22,450", "Top Deal", "https://placehold.co/300x300/f8fafc/1e293b?text=Polo+T-Shirt"},
        {"107", "Philips Digital Air Fryer HD9252/90 (4.1L, Black)", "Appliances", "7999", "11995", "4.5", "9,870", "1 Year Warranty", "https://placehold.co/300x300/f8fafc/1e293b?text=Philips+Air+Fryer"},
        {"108", "LG 260 L 3 Star Frost-Free Double Door Refrigerator", "Appliances", "24490", "31990", "4.4", "5,320", "Free Installation", "https://placehold.co/300x300/f8fafc/1e293b?text=LG+Refrigerator"}
    };

    String[] categories = {"All", "Mobiles", "Electronics", "Fashion", "Appliances"};
    String serverTimestamp = new SimpleDateFormat("dd MMM yyyy, hh:mm a").format(new Date());
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ShopKart - Online Shopping for Mobiles, Electronics, Fashion &amp; More</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; font-family: Arial, Helvetica, sans-serif; }
        body { background-color: #eaeded; color: #0f1111; }

        /* Top Navbar */
        .navbar {
            background-color: #131921;
            color: #fff;
            display: flex;
            align-items: center;
            padding: 10px 20px;
            gap: 16px;
            position: sticky;
            top: 0;
            z-index: 100;
        }
        .logo { font-size: 24px; font-weight: bold; color: #fff; text-decoration: none; letter-spacing: -0.5px; }
        .logo span { color: #febd69; font-style: italic; }
        .location-box { font-size: 12px; line-height: 1.2; cursor: pointer; min-width: 130px; }
        .location-box strong { font-size: 13px; display: block; }

        /* Search Bar */
        .search-bar {
            flex: 1;
            display: flex;
            height: 40px;
            border-radius: 4px;
            overflow: hidden;
        }
        .search-bar select {
            background: #f3f3f3;
            border: none;
            padding: 0 10px;
            color: #333;
            font-size: 13px;
            border-right: 1px solid #cdcdcd;
        }
        .search-bar input {
            flex: 1;
            border: none;
            padding: 0 12px;
            font-size: 15px;
            outline: none;
        }
        .search-bar button {
            background: #febd69;
            border: none;
            padding: 0 18px;
            font-weight: bold;
            cursor: pointer;
            font-size: 15px;
        }
        .search-bar button:hover { background: #f3a847; }

        .nav-actions { display: flex; align-items: center; gap: 20px; font-size: 13px; }
        .nav-item { cursor: pointer; }
        .nav-item strong { display: block; font-size: 14px; }
        .cart-btn {
            display: flex;
            align-items: center;
            gap: 6px;
            background: #232f3e;
            padding: 8px 14px;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
        }
        .cart-count {
            background: #f08804;
            color: #111;
            padding: 2px 7px;
            border-radius: 12px;
            font-size: 13px;
        }

        /* Sub-navigation Bar */
        .subnav {
            background-color: #232f3e;
            color: #fff;
            padding: 8px 20px;
            display: flex;
            gap: 18px;
            font-size: 14px;
            overflow-x: auto;
        }
        .subnav span { cursor: pointer; padding: 4px 8px; border-radius: 3px; white-space: nowrap; }
        .subnav span:hover, .subnav span.active { background-color: #37475a; color: #febd69; font-weight: bold; }

        /* Hero Banner */
        .hero {
            background: linear-gradient(135deg, #2874f0 0%, #131921 100%);
            color: white;
            padding: 36px 40px;
            margin: 15px 20px;
            border-radius: 6px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .hero h1 { font-size: 28px; margin-bottom: 8px; }
        .hero p { font-size: 15px; color: #e2e8f0; margin-bottom: 14px; }
        .hero-tag { background: #febd69; color: #111; padding: 5px 12px; font-weight: bold; border-radius: 3px; font-size: 13px; display: inline-block; }

        /* Product Grid */
        .container { max-width: 1400px; margin: 0 auto; padding: 10px 20px 40px; }
        .section-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 15px; }
        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(270px, 1fr));
            gap: 18px;
        }
        .card {
            background: #fff;
            border-radius: 6px;
            padding: 16px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
            transition: transform 0.15s ease;
        }
        .card:hover { transform: translateY(-3px); box-shadow: 0 4px 12px rgba(0,0,0,0.15); }
        .card img { width: 100%; height: 200px; object-fit: contain; margin-bottom: 12px; }
        .card-category { font-size: 11px; color: #565959; text-transform: uppercase; margin-bottom: 4px; }
        .card-title { font-size: 15px; font-weight: 600; color: #0f1111; margin-bottom: 8px; line-height: 1.35; }
        .rating-row { display: flex; align-items: center; gap: 6px; margin-bottom: 8px; font-size: 13px; }
        .rating-badge { background: #388e3c; color: #fff; padding: 2px 6px; border-radius: 3px; font-weight: bold; font-size: 12px; }
        .price-row { margin-bottom: 6px; }
        .price { font-size: 21px; font-weight: bold; color: #0f1111; }
        .mrp { font-size: 13px; color: #565959; text-decoration: line-through; margin-left: 6px; }
        .discount { font-size: 13px; color: #388e3c; font-weight: bold; margin-left: 6px; }
        .delivery-badge { font-size: 12px; color: #007600; font-weight: 600; margin-bottom: 12px; }

        .btn-group { display: flex; gap: 8px; }
        .btn-cart {
            flex: 1; background: #ffd814; border: 1px solid #fcd200; border-radius: 20px;
            padding: 8px; font-weight: bold; cursor: pointer; font-size: 13px;
        }
        .btn-cart:hover { background: #f7ca00; }
        .btn-buy {
            flex: 1; background: #ffa41c; border: 1px solid #ff8f00; border-radius: 20px;
            padding: 8px; font-weight: bold; cursor: pointer; font-size: 13px;
        }
        .btn-buy:hover { background: #fa8900; }

        /* Cart Drawer */
        .cart-drawer {
            position: fixed; top: 0; right: -380px; width: 360px; height: 100vh;
            background: #fff; box-shadow: -4px 0 15px rgba(0,0,0,0.2);
            transition: right 0.25s ease; z-index: 200; display: flex; flex-direction: column;
        }
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

    <!-- Top Navigation -->
    <header class="navbar">
        <a href="index.jsp" class="logo">Shop<span>Kart</span></a>
        <div class="location-box">
            Deliver to Nithin
            <strong>Bengaluru 560001</strong>
        </div>

        <div class="search-bar">
            <select id="categorySelect" onchange="filterProducts()">
                <% for (int i = 0; i < categories.length; i++) { %>
                    <option value="<%= categories[i] %>"><%= categories[i] %></option>
                <% } %>
            </select>
            <input
