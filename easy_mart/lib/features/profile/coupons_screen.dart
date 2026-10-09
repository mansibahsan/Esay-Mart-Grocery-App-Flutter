import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';
import '../cart/cart_provider.dart';

class CouponsScreen extends ConsumerWidget {
  const CouponsScreen({super.key});

  static const List<Map<String, dynamic>> availableCoupons = [
    {
      'code': 'FRESH30',
      'discount': '30% OFF',
      'title': '30% Off Fresh Vegetables & Fruits',
      'description': 'Enjoy 30% discount on fresh produce across the app.',
      'minSpend': '\$25.00',
      'validUntil': '31 Oct 2026',
      'color': Color(0xFF2E7D32),
    },
    {
      'code': 'SAVE10',
      'discount': '\$10 OFF',
      'title': 'Flat \$10 Off Super Saver',
      'description': 'Applicable on orders containing dairy, eggs, and bakery.',
      'minSpend': '\$40.00',
      'validUntil': '15 Nov 2026',
      'color': Color(0xFFE65100),
    },
    {
      'code': 'FREEDEL',
      'discount': 'FREE DELIVERY',
      'title': 'Zero Delivery Fee Promo',
      'description': 'Enjoy free express 30-min doorstep delivery on any order.',
      'minSpend': '\$15.00',
      'validUntil': '05 Nov 2026',
      'color': Color(0xFF1565C0),
    },
    {
      'code': 'ORGANIC15',
      'discount': '15% OFF',
      'title': '15% Off Organic Essentials',
      'description': 'Special discount for first-time organic store orders.',
      'minSpend': '\$20.00',
      'validUntil': '20 Nov 2026',
      'color': Color(0xFF6A1B9A),
    },
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartState = ref.watch(cartProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Coupons & Offers',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: availableCoupons.length,
        separatorBuilder: (ctx, i) => const SizedBox(height: 14),
        itemBuilder: (context, index) {
          final coupon = availableCoupons[index];
          final code = coupon['code'] as String;
          final color = coupon['color'] as Color;
          final isApplied = cartState.appliedCoupon == code;

          return Container(
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isApplied ? color : AppColors.borderSubtle,
                width: isApplied ? 2.0 : 1.0,
              ),
              boxShadow: AppColors.softShadow,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Column(
                children: [
                  // Top Banner
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    color: color.withAlpha(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.local_offer_rounded,
                                color: color, size: 20),
                            const SizedBox(width: 8),
                            Text(
                              coupon['discount'],
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: color,
                              ),
                            ),
                          ],
                        ),
                        if (isApplied)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 3),
                            decoration: BoxDecoration(
                              color: color,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'Applied in Cart',
                              style: GoogleFonts.inter(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),

                  // Content
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          coupon['title'],
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          coupon['description'],
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: AppColors.textSecondary,
                            height: 1.3,
                          ),
                        ),
                        const SizedBox(height: 14),

                        // Code Row with Copy and Apply
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: AppColors.surfaceMuted,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColors.borderSubtle),
                          ),
                          child: Row(
                            children: [
                              Text(
                                code,
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              const SizedBox(width: 8),
                              IconButton(
                                icon: const Icon(Icons.copy_rounded, size: 18),
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                tooltip: 'Copy Code',
                                onPressed: () {
                                  Clipboard.setData(
                                      ClipboardData(text: code));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Coupon code "$code" copied!'),
                                      duration: const Duration(seconds: 2),
                                    ),
                                  );
                                },
                              ),
                              const Spacer(),
                              ElevatedButton(
                                onPressed: () {
                                  final success = ref
                                      .read(cartProvider.notifier)
                                      .applyCoupon(code);
                                  if (success) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            'Coupon "$code" applied to your cart!'),
                                        backgroundColor: AppColors.primary,
                                        action: SnackBarAction(
                                          label: 'View Cart',
                                          textColor: Colors.white,
                                          onPressed: () =>
                                              context.push('/cart'),
                                        ),
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            'Coupon "$code" recorded. Add items to cart to activate!'),
                                        backgroundColor: AppColors.primary,
                                      ),
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: isApplied
                                      ? Colors.grey
                                      : AppColors.primary,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14, vertical: 8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: Text(
                                  isApplied ? 'Applied' : 'Apply to Cart',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Min Spend: ${coupon['minSpend']}',
                              style: GoogleFonts.inter(
                                fontSize: 11,
                                color: AppColors.textMuted,
                              ),
                            ),
                            Text(
                              'Expires: ${coupon['validUntil']}',
                              style: GoogleFonts.inter(
                                fontSize: 11,
                                color: AppColors.textMuted,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
