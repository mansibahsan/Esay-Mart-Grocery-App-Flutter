import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';
import '../../data/models/cart_item.dart';
import '../../data/models/order.dart';
import '../../data/repositories/mock_data.dart';
import '../cart/cart_provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  void _showDemoPersonaModal(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (ctx) => Container(
        padding: const EdgeInsets.all(22),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.border,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.slideshow_rounded,
                    color: AppColors.primary, size: 26),
                const SizedBox(width: 10),
                Text(
                  'Client Demo Persona Switcher',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              'Select a pre-seeded persona to instantly showcase different app journeys to clients.',
              style: GoogleFonts.inter(
                fontSize: 13,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 20),

            // Persona 1: New Shopper
            _buildPersonaCard(
              context,
              title: '🌱 New Shopper Persona',
              subtitle: 'Clean state: Empty cart, no orders. Great for demoing onboarding & browsing.',
              badge: 'Fresh User',
              color: const Color(0xFF2E7D32),
              onTap: () {
                ref.read(cartProvider.notifier).clearCart();
                Navigator.pop(ctx);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Switched to New Shopper persona (cart cleared).'),
                    backgroundColor: AppColors.primary,
                  ),
                );
              },
            ),
            const SizedBox(height: 12),

            // Persona 2: Active Cart Shopper
            _buildPersonaCard(
              context,
              title: '🛒 Active Cart Shopper',
              subtitle: 'Pre-fills cart with 4 items & FRESH30 coupon (\$17.39 total). Ready for 1-tap checkout.',
              badge: 'Ready to Checkout',
              color: const Color(0xFFE65100),
              onTap: () {
                final cart = ref.read(cartProvider.notifier);
                cart.clearCart();
                cart.addToCart(MockData.products[0], quantity: 2, unit: '500g');
                cart.addToCart(MockData.products[1], quantity: 1, unit: '1 kg');
                cart.addToCart(MockData.products[3], quantity: 1, unit: '3 pcs');
                cart.addToCart(MockData.products[8], quantity: 1, unit: '400g');
                cart.applyCoupon('FRESH30');

                Navigator.pop(ctx);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text(
                        'Switched to Active Shopper (4 items in cart + 30% OFF)!'),
                    backgroundColor: AppColors.primary,
                    action: SnackBarAction(
                      label: 'Open Cart',
                      textColor: Colors.white,
                      onPressed: () => context.push('/cart'),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),

            // Persona 3: Live Order in Transit
            _buildPersonaCard(
              context,
              title: '🛵 Live Delivery In-Transit',
              subtitle: 'Seeds order #EM-89241 out for delivery with rider location. Opens tracking screen.',
              badge: 'Live GPS Demo',
              color: const Color(0xFF1565C0),
              onTap: () {
                final activeOrder = Order(
                  id: 'EM-89241',
                  items: [
                    CartItem(
                        product: MockData.products[0],
                        quantity: 2,
                        selectedUnit: '500g'),
                    CartItem(
                        product: MockData.products[1],
                        quantity: 1,
                        selectedUnit: '1 kg'),
                    CartItem(
                        product: MockData.products[4],
                        quantity: 1,
                        selectedUnit: '400g box'),
                  ],
                  subtotal: 15.48,
                  deliveryFee: 2.50,
                  discount: 4.64,
                  total: 13.34,
                  status: OrderStatus.outForDelivery,
                  placedAt:
                      DateTime.now().subtract(const Duration(minutes: 18)),
                  deliveryAddress: MockData.defaultAddress,
                  paymentMethod: 'Cash on Delivery',
                  deliverySlot: 'Express Delivery ⚡',
                  estimatedDeliveryTime: '5-10 mins',
                );

                if (MockData.pastOrders.isEmpty ||
                    MockData.pastOrders.first.id != 'EM-89241') {
                  MockData.pastOrders.insert(0, activeOrder);
                }

                Navigator.pop(ctx);
                context.push('/order-tracking/EM-89241', extra: activeOrder);
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildPersonaCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String badge,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: color.withAlpha(12),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: color.withAlpha(80), width: 1.2),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          badge,
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios_rounded,
                size: 16, color: AppColors.textMuted),
          ],
        ),
      ),
    );
  }

  void _showPaymentMethodsModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.border,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Supported Payment Methods',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 14),
            _buildPaymentRow(Icons.payments_outlined, 'Cash on Delivery',
                'Pay with cash when package arrives'),
            const Divider(height: 20, color: AppColors.borderSubtle),
            _buildPaymentRow(Icons.credit_card_rounded,
                'Visa / Mastercard / Amex', 'Instant 3D secure card processing'),
            const Divider(height: 20, color: AppColors.borderSubtle),
            _buildPaymentRow(Icons.account_balance_wallet_outlined,
                'Mobile Wallets (bKash & Nagad)', 'Instant 1-tap checkout PIN payment'),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentRow(IconData icon, String title, String subtitle) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.primaryLight,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: AppColors.primary, size: 22),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                subtitle,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = MockData.currentUser;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            // User Header Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.borderSubtle),
                boxShadow: AppColors.softShadow,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: AppColors.primaryLight,
                    child: Text(
                      'MA',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.name,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          user.email,
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          user.phone,
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: AppColors.textMuted,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit_outlined,
                        color: AppColors.primary),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Profile edit saved.')),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // Demo Pitch Controls Banner
            InkWell(
              onTap: () => _showDemoPersonaModal(context, ref),
              borderRadius: BorderRadius.circular(16),
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primary,
                      AppColors.primaryDark,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withAlpha(80),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(50),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.auto_awesome_rounded,
                          color: Colors.white, size: 24),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Demo Pitch Switcher 🎯',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Tap to switch personas & pre-seed demo states',
                            style: GoogleFonts.inter(
                              fontSize: 11,
                              color: Colors.white.withAlpha(220),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios_rounded,
                        color: Colors.white, size: 16),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Profile Options Menu
            Container(
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.borderSubtle),
              ),
              child: Column(
                children: [
                  _buildProfileTile(
                    context,
                    icon: Icons.history_rounded,
                    title: 'Order History',
                    subtitle: 'Track past orders and receipts',
                    onTap: () => context.push('/orders'),
                  ),
                  const Divider(height: 1, color: AppColors.borderSubtle),
                  _buildProfileTile(
                    context,
                    icon: Icons.favorite_border_rounded,
                    title: 'My Wishlist',
                    subtitle: 'View saved favorite items',
                    onTap: () => context.push('/favorites'),
                  ),
                  const Divider(height: 1, color: AppColors.borderSubtle),
                  _buildProfileTile(
                    context,
                    icon: Icons.location_on_outlined,
                    title: 'Delivery Addresses',
                    subtitle: 'Manage saved delivery destinations',
                    onTap: () => context.push('/addresses'),
                  ),
                  const Divider(height: 1, color: AppColors.borderSubtle),
                  _buildProfileTile(
                    context,
                    icon: Icons.payment_outlined,
                    title: 'Payment Methods',
                    subtitle: 'Cards, Cash on Delivery, Mobile Banking',
                    onTap: () => _showPaymentMethodsModal(context),
                  ),
                  const Divider(height: 1, color: AppColors.borderSubtle),
                  _buildProfileTile(
                    context,
                    icon: Icons.local_offer_outlined,
                    title: 'Coupons & Vouchers',
                    subtitle: 'Save up to 30% with promo vouchers',
                    onTap: () => context.push('/coupons'),
                  ),
                  const Divider(height: 1, color: AppColors.borderSubtle),
                  _buildProfileTile(
                    context,
                    icon: Icons.notifications_none_rounded,
                    title: 'Notifications',
                    subtitle: 'Order updates and promotional offers',
                    onTap: () => context.push('/notifications'),
                  ),
                  const Divider(height: 1, color: AppColors.borderSubtle),
                  _buildProfileTile(
                    context,
                    icon: Icons.support_agent_rounded,
                    title: 'Help & 24/7 Support',
                    subtitle: 'Chat with concierge customer care',
                    onTap: () => context.push('/support'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Logout Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text('Log Out'),
                      content: const Text(
                          'Are you sure you want to sign out of Easy Mart?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(ctx),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(ctx);
                            context.go('/auth');
                          },
                          child: const Text('Log Out',
                              style: TextStyle(color: AppColors.error)),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.logout_rounded, color: AppColors.error),
                label: Text(
                  'Log Out',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.error,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.error, width: 1.2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.primaryLight,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: AppColors.primary, size: 22),
      ),
      title: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: GoogleFonts.inter(
          fontSize: 12,
          color: AppColors.textSecondary,
        ),
      ),
      trailing: const Icon(
        Icons.chevron_right_rounded,
        color: AppColors.textMuted,
        size: 20,
      ),
      onTap: onTap,
    );
  }
}
