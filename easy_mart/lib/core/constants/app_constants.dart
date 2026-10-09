class AppConstants {
  AppConstants._();

  static const String appName = 'Easy Mart';
  static const String appTagline = 'Fresh Groceries Delivered in 30 Mins';

  // Persistence Keys
  static const String keyOnboardingSeen = 'has_seen_onboarding';
  static const String keyCartItems = 'cart_items_json';
  static const String keyAuthToken = 'auth_token';
  static const String keySavedAddress = 'saved_address';

  // Financial Constants
  static const String currency = '\$';
  static const double standardDeliveryFee = 2.50;
  static const double freeDeliveryThreshold = 35.00;
  static const double expressDeliveryFee = 4.00;

  // Working Demo Coupons
  static const Map<String, double> demoCoupons = {
    'FRESH30': 0.30,   // 30% discount
    'SAVE10': 10.00,   // $10 flat discount
    'EASY5': 5.00,     // $5 flat discount
    'FREEDEL': 2.50,   // Free delivery waiver
    'ORGANIC15': 0.15, // 15% discount
  };
}
