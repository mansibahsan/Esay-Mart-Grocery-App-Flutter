import 'package:flutter/material.dart';
import '../models/product.dart';
import '../models/category.dart';
import '../models/address.dart';
import '../models/user.dart';
import '../models/order.dart';
import '../models/cart_item.dart';

class MockData {
  MockData._();

  static const List<Category> categories = [
    Category(
      id: 'veg',
      name: 'Vegetables',
      icon: Icons.eco_rounded,
      backgroundColor: Color(0xFFE9F5EC),
      itemCount: 48,
    ),
    Category(
      id: 'fruits',
      name: 'Fruits',
      icon: Icons.apple_rounded,
      backgroundColor: Color(0xFFFFF4E5),
      itemCount: 36,
    ),
    Category(
      id: 'dairy',
      name: 'Dairy & Eggs',
      icon: Icons.egg_outlined,
      backgroundColor: Color(0xFFE6F4FA),
      itemCount: 28,
    ),
    Category(
      id: 'bakery',
      name: 'Bakery',
      icon: Icons.bakery_dining_rounded,
      backgroundColor: Color(0xFFFFF8E7),
      itemCount: 22,
    ),
    Category(
      id: 'meat',
      name: 'Meat & Fish',
      icon: Icons.set_meal_rounded,
      backgroundColor: Color(0xFFFFECEB),
      itemCount: 19,
    ),
    Category(
      id: 'beverages',
      name: 'Beverages',
      icon: Icons.local_drink_rounded,
      backgroundColor: Color(0xFFE8F5E9),
      itemCount: 31,
    ),
  ];

  static const List<Product> products = [
    Product(
      id: 'p1',
      name: 'Fresh Organic Broccoli',
      imageUrl:
          'https://images.unsplash.com/photo-1459411621453-7b03977f4bfc?auto=format&fit=crop&w=600&q=80',
      images: [
        'https://images.unsplash.com/photo-1459411621453-7b03977f4bfc?auto=format&fit=crop&w=600&q=80',
        'https://images.unsplash.com/photo-1584270359004-221051515286?auto=format&fit=crop&w=600&q=80',
        'https://images.unsplash.com/photo-1510627498534-cf7e9002facc?auto=format&fit=crop&w=600&q=80',
        'https://images.unsplash.com/photo-1583663848850-46af132dc08e?auto=format&fit=crop&w=600&q=80',
      ],
      unit: '500g',
      category: 'Vegetables',
      price: 3.49,
      discountPrice: 2.79,
      rating: 4.9,
      reviewsCount: 128,
      inStock: true,
      description:
          'Freshly harvested green broccoli crowns from local organic farms. Packed with vitamin C, fiber, and potent antioxidants.',
      nutritionalInfo: {
        'Calories': '34 kcal',
        'Protein': '2.8g',
        'Carbs': '6.6g',
        'Fiber': '2.6g',
      },
      availableUnits: ['250g', '500g', '1kg'],
    ),
    Product(
      id: 'p2',
      name: 'Vine-Ripened Red Tomatoes',
      imageUrl:
          'https://images.unsplash.com/photo-1592924357228-91a4daadcfea?auto=format&fit=crop&w=600&q=80',
      images: [
        'https://images.unsplash.com/photo-1592924357228-91a4daadcfea?auto=format&fit=crop&w=600&q=80',
        'https://images.unsplash.com/photo-1546470427-e26264be0b11?auto=format&fit=crop&w=600&q=80',
        'https://images.unsplash.com/photo-1518977676601-b53f82aba655?auto=format&fit=crop&w=600&q=80',
        'https://images.unsplash.com/photo-1561136594-7f68413baa99?auto=format&fit=crop&w=600&q=80',
      ],
      unit: '1 kg',
      category: 'Vegetables',
      price: 2.99,
      discountPrice: 2.19,
      rating: 4.8,
      reviewsCount: 95,
      inStock: true,
      description:
          'Plump, juicy, vine-ripened red tomatoes. Ideal for crisp fresh salads, pasta sauces, or sandwiches.',
      nutritionalInfo: {
        'Calories': '18 kcal',
        'Protein': '0.9g',
        'Carbs': '3.9g',
        'Vitamin C': '14mg',
      },
      availableUnits: ['500g', '1 kg', '2 kg'],
    ),
    Product(
      id: 'p3',
      name: 'Crunchy Orange Carrots',
      imageUrl:
          'https://images.unsplash.com/photo-1598170845058-32b9d6a5da37?auto=format&fit=crop&w=600&q=80',
      images: [
        'https://images.unsplash.com/photo-1598170845058-32b9d6a5da37?auto=format&fit=crop&w=600&q=80',
        'https://images.unsplash.com/photo-1447175008436-054170c2e979?auto=format&fit=crop&w=600&q=80',
        'https://images.unsplash.com/photo-1522184216316-3c25379f9760?auto=format&fit=crop&w=600&q=80',
        'https://images.unsplash.com/photo-1590868309235-ea34bed7bd7f?auto=format&fit=crop&w=600&q=80',
      ],
      unit: '1 kg',
      category: 'Vegetables',
      price: 2.49,
      rating: 4.7,
      reviewsCount: 64,
      inStock: true,
      description:
          'Sweet and crisp organic carrots, high in Beta-Carotene and vitamin A. Perfect for juicing, cooking, and snacking.',
      nutritionalInfo: {
        'Calories': '41 kcal',
        'Fiber': '2.8g',
        'Vitamin A': '835mcg',
      },
      availableUnits: ['500g', '1 kg', '3 kg'],
    ),
    Product(
      id: 'p4',
      name: 'Creamy Hass Avocados',
      imageUrl:
          'https://images.unsplash.com/photo-1523049673857-eb18f1d7b578?auto=format&fit=crop&w=600&q=80',
      images: [
        'https://images.unsplash.com/photo-1523049673857-eb18f1d7b578?auto=format&fit=crop&w=600&q=80',
        'https://images.unsplash.com/photo-1590005354167-6da97870c757?auto=format&fit=crop&w=600&q=80',
        'https://images.unsplash.com/photo-1601039641847-7857b994d704?auto=format&fit=crop&w=600&q=80',
        'https://images.unsplash.com/photo-1540420773420-3366772f4999?auto=format&fit=crop&w=600&q=80',
      ],
      unit: '3 pcs',
      category: 'Fruits',
      price: 4.99,
      discountPrice: 3.99,
      rating: 4.9,
      reviewsCount: 184,
      inStock: true,
      description:
          'Hand-picked ripe Hass avocados with buttery texture. Loaded with healthy monounsaturated fats and potassium.',
      nutritionalInfo: {
        'Calories': '160 kcal',
        'Healthy Fats': '15g',
        'Fiber': '7g',
      },
      availableUnits: ['2 pcs', '3 pcs', '5 pcs'],
    ),
    Product(
      id: 'p5',
      name: 'Sweet Red Strawberries',
      imageUrl:
          'https://images.unsplash.com/photo-1464965911861-746a04b4bca6?auto=format&fit=crop&w=600&q=80',
      images: [
        'https://images.unsplash.com/photo-1464965911861-746a04b4bca6?auto=format&fit=crop&w=600&q=80',
        'https://images.unsplash.com/photo-1518635017498-87f514b751ba?auto=format&fit=crop&w=600&q=80',
        'https://images.unsplash.com/photo-1543158181-e6f9f6712055?auto=format&fit=crop&w=600&q=80',
        'https://images.unsplash.com/photo-1464454709131-ffd692591ee5?auto=format&fit=crop&w=600&q=80',
      ],
      unit: '400g box',
      category: 'Fruits',
      price: 5.50,
      discountPrice: 4.25,
      rating: 4.9,
      reviewsCount: 210,
      inStock: true,
      description:
          'Deliciously sweet, fragrant, and vibrant red strawberries. Washed, graded, and carefully packaged.',
      nutritionalInfo: {
        'Calories': '32 kcal',
        'Sugar': '4.9g',
        'Vitamin C': '59mg',
      },
      availableUnits: ['250g box', '400g box'],
    ),
    Product(
      id: 'p6',
      name: 'Fresh Farm Whole Milk',
      imageUrl:
          'https://images.unsplash.com/photo-1550583724-b2692b85b150?auto=format&fit=crop&w=600&q=80',
      images: [
        'https://images.unsplash.com/photo-1550583724-b2692b85b150?auto=format&fit=crop&w=600&q=80',
        'https://images.unsplash.com/photo-1528750997573-59b89d56f4f7?auto=format&fit=crop&w=600&q=80',
        'https://images.unsplash.com/photo-1563636619-e9143da7973b?auto=format&fit=crop&w=600&q=80',
        'https://images.unsplash.com/photo-1559598467-f8b76c8155d0?auto=format&fit=crop&w=600&q=80',
      ],
      unit: '1 Liter',
      category: 'Dairy & Eggs',
      price: 2.29,
      rating: 4.8,
      reviewsCount: 88,
      inStock: true,
      description:
          'Pasteurized homogenized fresh whole cow milk from grass-fed dairy cattle. Rich in calcium and essential vitamins.',
      nutritionalInfo: {
        'Calories': '62 kcal',
        'Protein': '3.2g',
        'Calcium': '120mg',
      },
      availableUnits: ['1 Liter', '2 Liters'],
    ),
    Product(
      id: 'p7',
      name: 'Free-Range Brown Eggs',
      imageUrl:
          'https://images.unsplash.com/photo-1582722872445-44dc5f7e3c8f?auto=format&fit=crop&w=600&q=80',
      images: [
        'https://images.unsplash.com/photo-1582722872445-44dc5f7e3c8f?auto=format&fit=crop&w=600&q=80',
        'https://images.unsplash.com/photo-1506976785307-8732e854ad03?auto=format&fit=crop&w=600&q=80',
        'https://images.unsplash.com/photo-1598965675045-45c5e814d973?auto=format&fit=crop&w=600&q=80',
        'https://images.unsplash.com/photo-1569288052389-adc9b9accc4a?auto=format&fit=crop&w=600&q=80',
      ],
      unit: '12 pcs',
      category: 'Dairy & Eggs',
      price: 4.19,
      discountPrice: 3.49,
      rating: 4.9,
      reviewsCount: 142,
      inStock: true,
      description:
          'Grade-A large organic brown eggs from pasture-raised hens with bright golden yolks.',
      nutritionalInfo: {'Protein': '6g / egg', 'Calories': '72 kcal'},
      availableUnits: ['6 pcs', '12 pcs', '30 pcs tray'],
    ),
    Product(
      id: 'p8',
      name: 'Artisan Chocolate Fudge Cake',
      imageUrl:
          'https://images.unsplash.com/photo-1578985545062-69928b1d9587?auto=format&fit=crop&w=600&q=80',
      images: [
        'https://images.unsplash.com/photo-1578985545062-69928b1d9587?auto=format&fit=crop&w=600&q=80',
        'https://images.unsplash.com/photo-1554907253-5f1d721e3586?auto=format&fit=crop&w=600&q=80',
        'https://images.unsplash.com/photo-1565958011703-44f9829ba187?auto=format&fit=crop&w=600&q=80',
        'https://images.unsplash.com/photo-1606313564200-e75d5e30476c?auto=format&fit=crop&w=600&q=80',
      ],
      unit: '500g',
      category: 'Bakery',
      price: 4.99,
      discountPrice: 3.99,
      rating: 4.9,
      reviewsCount: 78,
      inStock: true,
      description:
          'Decadent multi-layered artisan chocolate fudge cake crafted with rich Belgian cocoa, silky dark ganache, and moist chocolate sponge.',
      nutritionalInfo: {'Calories': '320 kcal', 'Carbs': '38g', 'Cocoa': '70%'},
      availableUnits: ['500g', '1 kg'],
    ),
    Product(
      id: 'p9',
      name: 'Frozen Atlantic Salmon Fillet',
      imageUrl:
          'https://thumb.wikimedia.org/wikipedia/commons/thumb/d/d5/CSIRO_ScienceImage_7411_Atlantic_salmon.jpg/960px-CSIRO_ScienceImage_7411_Atlantic_salmon.jpg',
      images: [
        'https://thumb.wikimedia.org/wikipedia/commons/thumb/d/d5/CSIRO_ScienceImage_7411_Atlantic_salmon.jpg/960px-CSIRO_ScienceImage_7411_Atlantic_salmon.jpg',
        'https://thumb.wikimedia.org/wikipedia/commons/thumb/f/f8/Frozen_salmon_fillet.jpg/960px-Frozen_salmon_fillet.jpg',
        'https://thumb.wikimedia.org/wikipedia/commons/thumb/c/c3/17_Pike_Place_Market_king_salmon_on_sale.jpg/960px-17_Pike_Place_Market_king_salmon_on_sale.jpg',
        'https://thumb.wikimedia.org/wikipedia/commons/thumb/4/40/Halibut_and_salmon_fillets.jpg/960px-Halibut_and_salmon_fillets.jpg',
      ],
      unit: '400g',
      category: 'Meat & Fish',
      price: 11.99,
      discountPrice: 9.99,
      rating: 4.9,
      reviewsCount: 76,
      inStock: true,
      description:
          'Wild-caught Atlantic salmon, flash-frozen at peak freshness on ice to seal in pure taste and healthy Omega-3 fatty acids.',
      nutritionalInfo: {'Protein': '22g', 'Omega-3': '2.5g'},
      availableUnits: ['200g', '400g', '800g'],
    ),
    Product(
      id: 'p10',
      name: '100% Pure Squeezed Orange Juice',
      imageUrl:
          'https://images.unsplash.com/photo-1613478223719-2ab802602423?auto=format&fit=crop&w=600&q=80',
      images: [
        'https://images.unsplash.com/photo-1613478223719-2ab802602423?auto=format&fit=crop&w=600&q=80',
        'https://images.unsplash.com/photo-1600271886742-f049cd451bba?auto=format&fit=crop&w=600&q=80',
        'https://images.unsplash.com/photo-1547517023-7ca0c162f816?auto=format&fit=crop&w=600&q=80',
        'https://images.unsplash.com/photo-1621506289937-a8e4df240d0b?auto=format&fit=crop&w=600&q=80',
      ],
      unit: '1 Liter',
      category: 'Beverages',
      price: 3.89,
      rating: 4.8,
      reviewsCount: 63,
      inStock: true,
      description:
          'Freshly squeezed Florida Valencia oranges. No added sugar, no concentrates, 100% real fruit goodness.',
      nutritionalInfo: {'Vitamin C': '100% DV', 'Calories': '110 kcal'},
      availableUnits: ['500ml', '1 Liter'],
    ),
  ];

  static const List<Map<String, String>> promoBanners = [
    {
      'title': '30% OFF Fresh Greenery',
      'subtitle': 'Use voucher code FRESH30 at checkout',
      'tag': 'Limited Offer',
      'buttonText': 'Shop Veggies',
      'category': 'Vegetables',
      'colorHex': '0xFF2E9E4D',
      'imageUrl':
          'https://images.unsplash.com/photo-1540420773420-3366772f4999?auto=format&fit=crop&w=800&q=80',
    },
    {
      'title': 'Lightning 30-Min Delivery',
      'subtitle': 'Fresh groceries delivered straight to your door',
      'tag': 'Super Fast',
      'buttonText': 'Order Now',
      'category': 'Fruits',
      'colorHex': '0xFF1E2243',
      'imageUrl':
          'https://images.unsplash.com/photo-1542838132-92c53300491e?auto=format&fit=crop&w=800&q=80',
    },
    {
      'title': 'Daily Morning Bakery Deals',
      'subtitle': 'Hot sourdough, croissants, and artisan breads',
      'tag': 'Up to 25% Off',
      'buttonText': 'Explore',
      'category': 'Bakery',
      'colorHex': '0xFFFF7A00',
      'imageUrl':
          'https://images.unsplash.com/photo-1509440159596-0249088772ff?auto=format&fit=crop&w=800&q=80',
    },
  ];

  static const Address defaultAddress = Address(
    id: 'addr_1',
    label: 'Home',
    fullAddress: 'Apt 4B, Green Lake Residence, Block C, Gulshan-2',
    city: 'Dhaka',
    recipientName: 'Mansib Ahsan',
    phone: '+880 1712 345678',
    isDefault: true,
  );

  static const List<Address> savedAddresses = [
    defaultAddress,
    Address(
      id: 'addr_2',
      label: 'Office',
      fullAddress: 'Level 8, Concord Tower, Banani C/A',
      city: 'Dhaka',
      recipientName: 'Mansib Ahsan',
      phone: '+880 1712 345678',
      isDefault: false,
    ),
  ];

  static const AppUser currentUser = AppUser(
    id: 'usr_101',
    name: 'Mansib Ahsan',
    email: 'mansib.ahsan@example.com',
    phone: '+880 1712 345678',
    avatarUrl:
        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=400&q=80',
    addresses: savedAddresses,
  );

  static List<Order> pastOrders = [
    Order(
      id: 'EM-89241',
      items: [
        CartItem(product: products[0], quantity: 2, selectedUnit: '500g'),
        CartItem(product: products[3], quantity: 1, selectedUnit: '3 pcs'),
        CartItem(product: products[5], quantity: 2, selectedUnit: '1 Liter'),
      ],
      subtotal: 14.15,
      deliveryFee: 2.50,
      discount: 2.00,
      total: 14.65,
      status: OrderStatus.outForDelivery,
      placedAt: DateTime.now().subtract(const Duration(minutes: 18)),
      deliveryAddress: defaultAddress,
      paymentMethod: 'Cash on Delivery',
      deliverySlot: 'Express Delivery (30 mins)',
      estimatedDeliveryTime: '12 mins remaining',
    ),
    Order(
      id: 'EM-89104',
      items: [
        CartItem(product: products[1], quantity: 2, selectedUnit: '1 kg'),
        CartItem(product: products[4], quantity: 1, selectedUnit: '400g box'),
      ],
      subtotal: 8.63,
      deliveryFee: 0.00,
      discount: 0.00,
      total: 8.63,
      status: OrderStatus.delivered,
      placedAt: DateTime.now().subtract(const Duration(days: 2)),
      deliveryAddress: defaultAddress,
      paymentMethod: 'Mobile Banking (bKash)',
      deliverySlot: 'Standard Slot (10 AM - 12 PM)',
      estimatedDeliveryTime: 'Delivered successfully',
    ),
  ];
}
