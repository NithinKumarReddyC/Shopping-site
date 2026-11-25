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
        {"154", "OnePlus Nord 4 5G (256 GB) - Mercurial Silver", "Mobiles", "29999", "35999", "4.4", "7,840", "No Cost EMI • Free Delivery", "images/oneplus-nord4.svg", "256 GB • Snapdragon 7+ Gen 3 • 50 MP Sony camera • 6.74-inch AMOLED 120Hz • 100W SUPERVOOC", "📱"},
        {"155", "OnePlus 12R 5G (128 GB) - Iron Gray", "Mobiles", "39999", "44999", "4.5", "11,320", "Best Value Flagship", "images/oneplus-12r.svg", "128 GB • Snapdragon 8 Gen 2 • 50 MP OIS camera • 6.78-inch LTPO AMOLED • 100W charging", "📱"},
        // ── Electronics ──
        {"103", "ASUS Vivobook 15, Intel Core i5-1335U", "Electronics", "54990", "69990", "4.3", "3,410", "No Cost EMI Available", "images/asus-vivobook.svg", "Core i5 • 16 GB RAM • 512 GB SSD • 15.6-inch display", "💻"},
        {"104", "Sony WH-1000XM5 Wireless Noise Cancelling Headphones", "Electronics", "26990", "34990", "4.8", "6,105", "Best Seller", "images/sony-wh1000xm5.svg", "Wireless • Active noise cancellation • 30-hour battery", "🎧"},
        {"115", "Apple MacBook Air M3 (8 GB/256 GB SSD)", "Electronics", "99990", "114900", "4.8", "2,870", "Student Offer • No Cost EMI", "images/macbook-air.svg", "M3 chip • 8 GB RAM • 256 GB SSD • 13.6-inch Liquid Retina", "💻"},
        {"116", "Samsung Galaxy Tab S9 FE (128 GB) Wi-Fi", "Electronics", "30999", "44999", "4.4", "1,950", "Great Deal", "images/galaxy-tab.svg", "128 GB • Exynos 1380 • 10.9-inch • S Pen included", "📲"},
        {"118", "boAt Rockerz 550 Bluetooth Headphones", "Electronics", "1799", "4490", "4.1", "45,320", "Top Rated", "images/boat-rockerz.svg", "Bluetooth 5.0 • 20-hour battery • 50mm drivers • Foldable", "🎧"},
        {"122", "Noise ColorFit Pro 5 Max Smartwatch", "Electronics", "3499", "5999", "4.2", "12,780", "Trending Now", "images/smartwatch.svg", "1.96-inch AMOLED • Bluetooth calling • 100+ sports modes", "⌚"},
        {"123", "GoPro HERO12 Black Action Camera", "Electronics", "35990", "44990", "4.7", "4,820", "Free Accessories Bundle", "images/gopro-hero12.svg", "5.3K video • HyperSmooth 6.0 • 60m waterproof • Night lapse", "📷"},
        {"124", "DJI Mini 4 Pro Drone (Standard Edition)", "Electronics", "74999", "89999", "4.8", "2,140", "Best Drone 2024", "images/dji-drone.svg", "4K HDR • 34 min flight • Obstacle sensing • 20 km range", "🚁"},
        {"125", "Amazon Echo Dot (5th Gen) Smart Speaker", "Electronics", "4999", "5499", "4.5", "32,600", "Alexa Built-in", "images/echo-dot.svg", "Alexa • Improved bass • Eero Wi-Fi • Motion detection sensor", "🔊"},
        {"126", "Logitech MX Master 3S Wireless Mouse", "Electronics", "8995", "10995", "4.8", "9,340", "Best Productivity Mouse", "images/logitech-mouse.svg", "8000 DPI • MagSpeed scroll • Bluetooth + USB • 70-day battery", "🖱️"},
        {"127", "Lenovo IdeaPad Gaming 3 (RTX 3050, 16 GB RAM)", "Electronics", "69990", "89990", "4.4", "3,710", "Gaming Deal • No Cost EMI", "images/lenovo-gaming.svg", "Intel i7 • 16 GB RAM • 512 GB SSD • RTX 3050 • 15.6 FHD 120Hz", "🎮"},
        {"128", "Sony PlayStation 5 Slim Digital Edition", "Electronics", "44990", "54990", "4.9", "11,230", "Next Gen Gaming", "images/ps5-slim.svg", "825 GB SSD • 4K gaming • 120fps • DualSense controller included", "🕹️"},
        {"129", "Apple AirPods Pro (2nd Gen) with MagSafe Case", "Electronics", "24900", "26900", "4.7", "18,450", "Active Noise Cancellation", "images/airpods-pro.svg", "ANC • Transparency mode • H2 chip • 30hr total battery • USB-C", "🎧"},
        {"138", "Kindle Paperwhite (16 GB) Signature Edition", "Electronics", "16999", "21999", "4.7", "8,920", "300 PPI • Wireless Charging", "images/kindle.svg", "16 GB • 300 PPI • 10 weeks battery • Adjustable warm light • IPX8", "📚"},
        {"139", "Anker 737 Power Bank 24000 mAh (140W)", "Electronics", "6999", "9999", "4.6", "14,300", "Charge Laptop + 2 Phones", "images/powerbank.svg", "24000 mAh • 140W PD • Bi-directional • 3 ports • Smart display", "🔋"},
        {"140", "Zebronics Zeb-Delight 100 Portable Projector (1080p)", "Electronics", "14999", "21999", "4.3", "5,670", "Home Theatre Experience", "images/projector.svg", "1080p • 200 ANSI lumens • HDMI + USB • Built-in speaker • 50-inch screen", "📽️"},
        // ── Apple ──
        {"141", "Apple iPhone 15 Pro Max (256 GB) - Black Titanium", "Apple", "159900", "174900", "4.8", "21,340", "Titanium Design • No Cost EMI", "images/apple-iphone15promax.svg", "256 GB • A17 Pro chip • 48 MP ProRAW camera • Action Button • USB-C", "📱"},
        {"142", "Apple MacBook Pro 14-inch M3 Pro (18 GB / 512 GB)", "Apple", "199900", "224900", "4.9", "5,640", "Pro Performance Beast", "images/apple-macbook-pro14.svg", "M3 Pro • 18 GB RAM • 512 GB SSD • 14.2-inch Liquid Retina XDR • 22hr battery", "💻"},
        {"143", "Apple iPad Pro 12.9-inch M2 (256 GB) Wi-Fi - Space Grey", "Apple", "109900", "129900", "4.8", "7,820", "Best iPad Ever Made", "images/apple-ipad-pro.svg", "M2 chip • 256 GB • 12.9-inch Liquid Retina XDR • ProMotion 120Hz • Centre Stage", "📱"},
        {"144", "Apple iPad Air 11-inch M2 (128 GB) Wi-Fi - Blue", "Apple", "74900", "84900", "4.7", "9,430", "No Cost EMI Available", "images/apple-ipad-air.svg", "M2 chip • 128 GB • 11-inch Liquid Retina • 12 MP Wide camera • USB-C", "📲"},
        {"145", "Apple Watch Series 10 (46 mm) GPS - Jet Black", "Apple", "46900", "52900", "4.8", "14,250", "Thinnest Apple Watch Ever", "images/apple-watch-s10.svg", "46 mm • LTPO OLED • Blood oxygen • ECG • Crash detection • 36hr battery", "⌚"},
        {"146", "Apple Watch Ultra 2 (49 mm) - Black Titanium", "Apple", "89900", "99900", "4.9", "4,120", "Extreme Adventure Watch", "images/apple-watch-ultra2.svg", "49 mm • Micro-LED • Action Button • 72hr battery • Depth & dive app", "⌚"},
        {"147", "Apple Mac Mini M4 (16 GB / 256 GB SSD)", "Apple", "59900", "69900", "4.8", "6,870", "Smallest Mac Ever", "images/apple-mac-mini.svg", "M4 chip • 16 GB RAM • 256 GB SSD • Thunderbolt 4 • Wi-Fi 6E • 3x faster CPU", "🖥️"},
        {"148", "Apple iMac 24-inch M4 (16 GB / 512 GB) - Blue", "Apple", "149900", "169900", "4.9", "3,210", "All-in-One Powerhouse", "images/apple-imac.svg", "M4 chip • 24-inch 4.5K Retina • 16 GB RAM • 512 GB SSD • 12 MP camera", "🖥️"},
        {"149", "Apple AirPods Max (USB-C) - Midnight", "Apple", "59900", "64900", "4.7", "8,430", "Premium Over-Ear ANC", "images/apple-airpods-max.svg", "H1 chip • Active Noise Cancellation • Transparency • 20hr battery • Lossless audio", "🎧"},
        {"150", "Apple HomePod (2nd Gen) - Midnight", "Apple", "32900", "37900", "4.6", "5,960", "Spatial Audio Smart Speaker", "images/apple-homepod.svg", "S9 chip • Spatial Audio • Siri • Thread router • Room sensing • Temperature sensor", "🔊"},
        {"151", "Apple TV 4K (3rd Gen) Wi-Fi + Ethernet", "Apple", "19900", "22900", "4.7", "7,340", "Best Streaming Device", "images/apple-tv.svg", "A15 Bionic • 4K HDR • Dolby Vision • Dolby Atmos • Siri Remote • Thread", "📺"},
        {"152", "Apple Pencil Pro (2nd Gen) for iPad Pro & Air", "Apple", "11900", "13900", "4.8", "12,100", "Perfect for Creatives", "images/apple-pencil-pro.svg", "Squeeze gesture • Find My • Hover • Barrel Roll • Magnetic charge • Apple Pencil hover", "✏️"},
        {"153", "Apple MagSafe Battery Pack (5000 mAh)", "Apple", "9900", "12900", "4.5", "9,650", "Wireless Charging On-the-Go", "images/apple-magsafe-battery.svg", "5000 mAh • MagSafe • 7.5W wireless • USB-C passthrough • iPhone 12 & later", "🔋"},
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
        {"137", "Cadbury Dairy Milk Silk Chocolate Bar (150 g)", "Grocery", "165", "185", "4.8", "45,900", "Sweet Treat • Top Rated", "images/chocolate.gif", "150 g bar • Premium creamy & smooth milk chocolate", "🍫"},
        // ── Books ──
        {"201", "The Alchemist - Paulo Coelho (English)", "Books", "299", "350", "4.7", "1,25,400", "Best Seller • Inspiring", "images/book-alchemist.gif", "English • Fiction • 197 pages • HarperCollins", "📖"},
        {"202", "Atomic Habits - James Clear (English)", "Books", "499", "699", "4.8", "98,200", "No.1 Self-Help Book", "images/book-atomic-habits.gif", "English • Self-Help • 320 pages • Penguin Random House", "📗"},
        {"203", "Gone Girl - Gillian Flynn (English, Thriller)", "Books", "349", "499", "4.5", "67,800", "Psychological Thriller", "images/book-gone-girl.gif", "English • Psycho-Thriller • 432 pages • Crown Publishing", "📕"},
        {"204", "Into the Wild - Jon Krakauer (English, Adventure)", "Books", "275", "399", "4.6", "45,100", "True Adventure Story", "images/book-into-the-wild.gif", "English • Adventure • 224 pages • Pan Macmillan", "🏔️"},
        {"205", "The Girl on the Train - Paula Hawkins (Thriller)", "Books", "315", "450", "4.4", "72,500", "Gripping Psychological Thriller", "images/book-girl-on-train.gif", "English • Psycho-Thriller • 336 pages • Transworld Publishers", "🚂"},
        {"206", "Malgudi Days - R.K. Narayan (English, Indian Classic)", "Books", "199", "299", "4.6", "34,600", "Classic Indian Literature", "images/book-malgudi-days.gif", "English • Fiction • 256 pages • Indian Writing in English", "📚"},
        {"207", "Kannada Prabha - Kuvempu (Kannada Novel)", "Books", "250", "350", "4.5", "8,900", "Jnanpith Award Winner", "images/book-kannada-prabha.gif", "Kannada • Literature • 320 pages • Rashtrakavi Kuvempu", "📙"},
        {"208", "Mookajjiya Kanasugalu - K. Shivaram Karanth (Kannada)", "Books", "225", "325", "4.7", "12,400", "Kannada Classic • Must Read", "images/book-mookajjiya.gif", "Kannada • Fiction • 288 pages • Jnanpith Awardee Author", "📘"},
        {"209", "Veyi Padagalu - Viswanatha Satyanarayana (Telugu)", "Books", "399", "550", "4.8", "6,800", "Jnanpith Award Telugu Novel", "images/book-veyi-padagalu.gif", "Telugu • Classic Literature • 1100+ pages • Epic Novel", "📗"},
        {"210", "Barrister Parvateesam - Mokkapati (Telugu Comedy)", "Books", "175", "250", "4.5", "15,200", "Funniest Telugu Novel", "images/book-barrister.gif", "Telugu • Comedy Fiction • 280 pages • Humorous Classic", "😂"},
        {"211", "Godan - Munshi Premchand (Hindi Classic)", "Books", "185", "275", "4.7", "42,300", "Hindi Sahitya Classic", "images/book-godan.gif", "Hindi • Classic Literature • 312 pages • Premchand Masterpiece", "📖"},
        {"212", "Jurassic Park - Michael Crichton (English, Adventure)", "Books", "425", "599", "4.6", "56,700", "Sci-Fi Adventure Thriller", "images/book-jurassic-park.gif", "English • Sci-Fi Adventure • 448 pages • Ballantine Books", "🦖"},
        // ── Sports & Fitness ──
        {"301", "Yonex Astrox 88D Pro Badminton Racket", "Sports", "9499", "12999", "4.7", "3,420", "Top Player Choice", "images/badminton-racket.svg", "Graphite • 85g • 30 lbs tension • Steep attack style", "🏸"},
        {"302", "Nivia Storm Football (Size 5)", "Sports", "499", "799", "4.3", "8,750", "AIFF Approved", "images/football.svg", "Size 5 • 32-panel stitched • Durable rubber bladder", "⚽"},
        {"303", "Cosco Primo Cricket Kit (Youth)", "Sports", "2999", "4499", "4.2", "2,180", "Full Kit • Great Value", "images/cricket-kit.svg", "Bat + pads + gloves + helmet + bag • Junior size", "🏏"},
        {"304", "Boldfit Gym Gloves with Wrist Support", "Sports", "399", "799", "4.4", "21,600", "Best Seller • Gym Essentials", "images/gym-gloves.svg", "Anti-slip grip • Breathable mesh • Adjustable strap", "🧤"},
        {"305", "Decathlon Domyos 20 kg Dumbbell Set (Adjustable)", "Sports", "3499", "5499", "4.5", "6,340", "Home Gym Must-Have", "images/dumbbell.svg", "Cast iron plates • 20 kg set • Chrome bar • Collar lock", "🏋️"},
        {"306", "Nivia Encounter Lawn Tennis Racket", "Sports", "1299", "1999", "4.1", "5,870", "Beginner Friendly", "images/tennis-racket.svg", "Aluminium frame • 27 inch • 68-71 lbs string tension", "🎾"},
        {"307", "Adidas Predator 23 Club Football Boots", "Sports", "2499", "3999", "4.3", "4,520", "Free Delivery", "images/football-boots.svg", "Firm ground • Laceless • 3-stripes • EU 42", "👟"},
        // ── Beauty & Personal Care ──
        {"401", "Lakme 9to5 Primer + Matte Lipstick - Red Coat", "Beauty", "340", "449", "4.4", "31,200", "Best Seller Shade", "images/lipstick.svg", "12-hour stay • Primer infused • Matte finish • Red Coat", "💄"},
        {"402", "Neutrogena Deep Clean Brightening Foaming Scrub (100g)", "Beauty", "349", "499", "4.3", "19,800", "Dermatologist Tested", "images/face-scrub.svg", "Glycolic acid • Brightening • For all skin types • 100 g", "✨"},
        {"403", "Mamaearth Onion Hair Oil for Hair Fall Control (250 ml)", "Beauty", "349", "499", "4.4", "54,300", "No Sulphate • No Paraben", "images/hair-oil.svg", "Onion + Redensyl • Reduces hair fall • 250 ml", "🧴"},
        {"404", "Gillette Mach3 Turbo Manual Shaving Razor (3 Blades)", "Beauty", "199", "299", "4.6", "43,100", "Top Grooming Pick", "images/razor.svg", "Lubrastrip • Triple blade • Anti-friction coating", "🪒"},
        {"405", "Biotique Bio Morning Nectarine Face Wash (200 ml)", "Beauty", "169", "249", "4.2", "27,500", "100% Natural Ingredients", "images/face-wash.svg", "Ayurvedic • Oil-free • 200 ml • For normal to dry skin", "🌿"},
        {"406", "Plum Grape Seed & Sea Buckthorn Sunscreen SPF 50 (50 g)", "Beauty", "425", "575", "4.5", "14,900", "Lightweight • No White Cast", "images/sunscreen.svg", "SPF 50 PA++++ • Grape seed • Vegan • 50 g", "☀️"},
        {"407", "SUGAR Cosmetics Matte Attack Lipstick - Berry Me", "Beauty", "549", "699", "4.5", "22,400", "Trending Shade", "images/sugar-lipstick.svg", "5-hour wear • Matte • Moisturising • Berry shade", "💋"},
        // ── Toys & Games ──
        {"501", "LEGO Classic Creative Bricks Box (790 Pieces)", "Toys", "2499", "3499", "4.8", "7,840", "Award Winning Toy", "images/lego.svg", "790 pcs • Ages 4+ • Multiple builds • Creative play", "🧱"},
        {"502", "Hot Wheels Ultimate Garage Playset (3 Floors)", "Toys", "3499", "5999", "4.6", "5,120", "Cars Included", "images/hot-wheels.svg", "3-floor garage • Fits 35+ cars • Spiral ramp • Ages 3+", "🚗"},
        {"503", "Funskool Monopoly Classic Board Game", "Toys", "799", "1199", "4.5", "14,300", "Family Game Night Essential", "images/monopoly.svg", "2-6 players • Ages 8+ • Classic board game • 60+ min play", "🎲"},
        {"504", "Rubik's Cube 3x3 Original Speed Cube", "Toys", "349", "499", "4.4", "28,700", "Brain Teaser Classic", "images/rubiks-cube.svg", "3x3 • Smooth turning • Competition grade • Stickered", "🧩"},
        {"505", "Remote Control Car - 1:16 Scale Off-Road Buggy", "Toys", "1299", "2499", "4.3", "9,610", "High Speed 25 kmph", "images/rc-car.svg", "1:16 scale • 4WD • 2.4 GHz • Rechargeable • 25 km/h", "🚙"},
        {"506", "Nerf N-Strike Elite Disruptor Blaster (Blue)", "Toys", "699", "999", "4.4", "17,200", "High Impact Fun", "images/nerf-gun.svg", "6-dart rotating drum • 27m range • Slam fire • Ages 8+", "🔫"},
        // ── Kitchen & Dining ──
        {"601", "Prestige Svachh PPCCC4 Aluminium Pressure Cooker (5L)", "Kitchen", "1899", "2799", "4.5", "32,400", "1 Year Warranty", "images/pressure-cooker.svg", "5 Litre • Aluminium • Spillage control lid • Induction safe", "🍲"},
        {"602", "Milton Thermosteel Flip Lid Flask (1 Litre)", "Kitchen", "799", "1299", "4.6", "61,800", "Keeps Hot 24 hr", "images/thermos-flask.svg", "1 L • Stainless steel • Keeps hot 24 hr • Leak-proof lid", "☕"},
        {"603", "Borosil Vision Glass Set of 6 (305 ml each)", "Kitchen", "649", "999", "4.4", "24,500", "Microwave Safe", "images/glass-set.svg", "305 ml • Borosilicate • Dishwasher safe • Pack of 6", "🥤"},
        {"604", "Pigeon Favourite Gas Stove 2 Burner (Black)", "Kitchen", "1899", "2999", "4.3", "18,700", "BIS Certified", "images/gas-stove.svg", "2 burner • Toughened glass top • Manual ignition • ISI mark", "🔥"},
        {"605", "Prestige PPDPRC1.8 Rice Cooker (1.8 Litre)", "Kitchen", "1299", "1999", "4.4", "14,900", "Auto Cook & Warm", "images/rice-cooker.svg", "1.8 L • Auto cook & warm • 700W • Non-stick bowl", "🍚"},
        {"606", "Hawkins Futura Non-Stick Frying Pan (26 cm)", "Kitchen", "1099", "1799", "4.5", "21,300", "Best Seller Non-Stick", "images/frying-pan.svg", "26 cm • PFOA-free non-stick • Hard anodised • Induction base", "🍳"},
        {"607", "Cello World 4-Piece Casserole Set (1 L each)", "Kitchen", "699", "1199", "4.3", "12,100", "Microwave & Freezer Safe", "images/casserole-set.svg", "4 pcs • 1 L each • Borosilicate glass • Airtight lids", "🥘"},
        // ── Health & Wellness ──
        {"701", "Omron HEM-7120 Automatic Blood Pressure Monitor", "Health", "1849", "2799", "4.6", "28,900", "Clinically Validated", "images/bp-monitor.svg", "Upper arm • One-touch • 60-reading memory • Irregular heartbeat", "❤️"},
        {"702", "Accu-Chek Active Blood Glucose Meter + 10 Strips", "Health", "699", "1099", "4.5", "19,400", "Trusted by Doctors", "images/glucometer.svg", "No coding • 10 test strips included • Fast 5 sec result", "💉"},
        {"703", "Morepen Nebulizer Machine NB-50 (Compressor Type)", "Health", "1399", "2199", "4.4", "11,200", "Hospital Grade Mist", "images/nebulizer.svg", "Compressor • 0.5 ml/min flow • Piston pump • For adults & kids", "😷"},
        {"704", "Healthkart HK Vitals Fish Oil 1000 mg (60 Capsules)", "Health", "499", "699", "4.5", "36,800", "Omega-3 Supplement", "images/fish-oil.svg", "1000 mg • 180 mg EPA • 120 mg DHA • 60 softgels", "💊"},
        {"705", "Dr. Morepen Pulse Oximeter PO-14 (Fingertip)", "Health", "849", "1399", "4.5", "43,200", "Accurate SpO2 & PR", "images/oximeter.svg", "Fingertip • SpO2 & pulse rate • Large LED display • Batteries incl.", "🩺"},
        // ── Stationery & Office ──
        {"801", "Parker Beta Premium Ball Pen (Pack of 20)", "Stationery", "399", "599", "4.5", "52,100", "Office Best Seller", "images/ballpen.svg", "0.7mm tip • Smooth writing • Blue ink • 20 piece set", "🖊️"},
        {"802", "Classmate 1 Subject Long Notebook (Pack of 6)", "Stationery", "189", "299", "4.3", "78,400", "School Essential", "images/notebook.svg", "192 pages • Single line ruled • Long size • 6-pack", "📓"},
        {"803", "Stapler HD-10 Kangaro Heavy Duty (Full Strip)", "Stationery", "349", "499", "4.4", "31,200", "No 10 Staples Compatible", "images/stapler.svg", "No. 10 • 20-sheet capacity • Full strip • Jam-free mechanism", "📎"},
        {"804", "Camlin Kokuyo Art Kit (60-Piece)", "Stationery", "699", "999", "4.6", "14,800", "Complete Art Set", "images/art-kit.svg", "60 pcs • Oil pastels + watercolors + brushes + pencils", "🎨"},
        {"805", "Faber-Castell Grip Colour Pencil Set (36 Colours)", "Stationery", "549", "799", "4.7", "23,600", "Vibrant & Long Lasting", "images/colour-pencils.svg", "36 shades • Triangular grip • Soft core • Break-resistant", "✏️"},
        // ── Pet Supplies ──
        {"901", "Pedigree Adult Dry Dog Food Chicken & Veg (3 kg)", "Pets", "799", "1099", "4.6", "19,400", "Vet Recommended", "images/dog-food.svg", "3 kg • Chicken & vegetables • 100% complete nutrition • Adult dogs", "🐶"},
        {"902", "Whiskas Adult Dry Cat Food Tuna Flavour (1.2 kg)", "Pets", "499", "699", "4.5", "14,200", "Cats Love It", "images/cat-food.svg", "1.2 kg • Ocean fish & tuna • Omega 3 & 6 • For adult cats", "🐱"},
        {"903", "PetSafe Stainless Steel Pet Bowls (Set of 2)", "Pets", "349", "599", "4.4", "8,750", "Non-Toxic & Durable", "images/pet-bowls.svg", "2 bowls • 400 ml each • Stainless steel • Non-slip base", "🍽️"},
        // ── Travel & Luggage ──
        {"1001", "Skybags Trooper 55 cm Cabin Trolley Bag (Blue)", "Travel", "2999", "5999", "4.5", "12,400", "Lightweight 2.2 kg", "images/trolley-bag.svg", "55 cm • 4 wheels • TSA lock • Polycarbonate shell • 42 L", "🧳"},
        {"1002", "Wildcraft Trailblazer Rucksack 55 L (Green)", "Travel", "2499", "3999", "4.4", "7,830", "Trekking Essential", "images/rucksack.svg", "55 L • Rain cover • Multiple compartments • Ergonomic straps", "🎒"},
        {"1003", "Safari Bags TRIO 65 cm Hardsided Trolley (Red)", "Travel", "3499", "6999", "4.3", "5,920", "50% OFF • Flash Deal", "images/safari-bag.svg", "65 cm • 8 spinner wheels • TSA lock • Polypropylene shell", "🧳"},
        // ── Automotive ──
        {"1101", "Bosch Car Battery Charger (12V / 6A)", "Automotive", "2499", "3999", "4.5", "6,210", "Fully Automatic", "images/car-charger.svg", "12V • 6A • Fully automatic • Recovers deeply discharged batteries", "🔋"},
        {"1102", "3M Microfiber Car Cleaning Cloth (Pack of 3)", "Automotive", "449", "699", "4.4", "31,500", "Scratch-Free Cleaning", "images/car-cloth.svg", "40x40 cm • 380 GSM • Pack of 3 • Interior & exterior safe", "🚗"},
        {"1103", "Michelin Tyre Inflator with LCD Display (12V)", "Automotive", "1299", "2199", "4.5", "14,800", "Portable & Accurate", "images/tyre-inflator.svg", "12V DC • LCD display • Auto shut-off • 100 PSI max", "🏎️"},
        // ── Musical Instruments ──
        {"1201", "Fender CD-60S Acoustic Guitar (Natural)", "Music", "13999", "19999", "4.7", "4,320", "Best Beginner Guitar", "images/acoustic-guitar.svg", "Solid spruce top • Mahogany back • Dreadnought • Includes bag", "🎸"},
        {"1202", "Casio SA-78 Musical Keyboard (44 Keys)", "Music", "2799", "3999", "4.5", "9,610", "Perfect for Beginners", "images/keyboard.svg", "44 mini keys • 100 tones • 50 rhythms • LCD display • Adapter incl.", "🎹"},
        {"1203", "Yamaha FS100A Soprano Recorder (Blue)", "Music", "349", "599", "4.3", "12,840", "School Band Choice", "images/recorder-flute.svg", "ABS plastic • German fingering • Mouthpiece • Carry bag incl.", "🎵"}
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

    String[] categories = {"All", "Mobiles", "Electronics", "Apple", "Fashion", "Appliances", "Furniture", "Grocery", "Books", "Sports", "Beauty", "Toys", "Kitchen", "Health", "Stationery", "Pets", "Travel", "Automotive", "Music"};
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
