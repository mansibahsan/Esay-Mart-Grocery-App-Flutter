import 'package:go_router/go_router.dart';
import '../../data/models/order.dart';
import '../../data/models/product.dart';
import '../../data/repositories/mock_data.dart';
import '../../features/auth/forgot_password_screen.dart';
import '../../features/auth/otp_verification_screen.dart';
import '../../features/auth/sign_in_screen.dart';
import '../../features/auth/sign_up_screen.dart';
import '../../features/cart/cart_screen.dart';
import '../../features/categories/categories_screen.dart';
import '../../features/checkout/checkout_screen.dart';
import '../../features/checkout/order_success_screen.dart';
import '../../features/favorites/favorites_screen.dart';
import '../../features/onboarding/onboarding_screen.dart';
import '../../features/orders/order_tracking_screen.dart';
import '../../features/orders/orders_list_screen.dart';
import '../../features/product_details/product_details_screen.dart';
import '../../features/profile/addresses_screen.dart';
import '../../features/profile/coupons_screen.dart';
import '../../features/profile/notifications_screen.dart';
import '../../features/profile/support_screen.dart';
import '../../features/search/search_screen.dart';
import '../../features/shell/main_nav_screen.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: '/onboarding',
    routes: [
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/auth',
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: '/sign-up',
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: '/otp-verification',
        builder: (context, state) => const OtpVerificationScreen(),
      ),
      GoRoute(
        path: '/forgot-password',
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: '/main',
        builder: (context, state) => const MainNavScreen(),
      ),
      GoRoute(
        path: '/categories',
        builder: (context, state) => const CategoriesScreen(),
      ),
      GoRoute(
        path: '/search',
        builder: (context, state) {
          final category = state.uri.queryParameters['category'];
          return SearchScreen(initialCategory: category);
        },
      ),
      GoRoute(
        path: '/product/:id',
        builder: (context, state) {
          final productId = state.pathParameters['id'] ?? '';
          final product = state.extra as Product? ??
              MockData.products.firstWhere(
                (p) => p.id == productId,
                orElse: () => MockData.products.first,
              );
          return ProductDetailsScreen(product: product);
        },
      ),
      GoRoute(
        path: '/cart',
        builder: (context, state) => const CartScreen(),
      ),
      GoRoute(
        path: '/checkout',
        builder: (context, state) => const CheckoutScreen(),
      ),
      GoRoute(
        path: '/order-success',
        builder: (context, state) {
          final order = state.extra as Order? ?? MockData.pastOrders.first;
          return OrderSuccessScreen(order: order);
        },
      ),
      GoRoute(
        path: '/orders',
        builder: (context, state) => const OrdersListScreen(),
      ),
      GoRoute(
        path: '/order-tracking/:id',
        builder: (context, state) {
          final orderId = state.pathParameters['id'] ?? '';
          final order = state.extra as Order?;
          return OrderTrackingScreen(orderId: orderId, order: order);
        },
      ),
      GoRoute(
        path: '/favorites',
        builder: (context, state) => const FavoritesScreen(),
      ),
      GoRoute(
        path: '/addresses',
        builder: (context, state) => const AddressesScreen(),
      ),
      GoRoute(
        path: '/coupons',
        builder: (context, state) => const CouponsScreen(),
      ),
      GoRoute(
        path: '/notifications',
        builder: (context, state) => const NotificationsScreen(),
      ),
      GoRoute(
        path: '/support',
        builder: (context, state) => const SupportScreen(),
      ),
    ],
  );
}
