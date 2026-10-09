import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class OnboardingIllustration1 extends StatelessWidget {
  const OnboardingIllustration1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 280,
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        borderRadius: BorderRadius.circular(140),
      ),
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Decorative background circle
            Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                color: const Color(0xFFD6EEDD),
                shape: BoxShape.circle,
              ),
            ),
            // Aisle Shelving Graphic
            Positioned(
              top: 50,
              child: Container(
                width: 170,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(200),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.primary.withAlpha(50), width: 1.5),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Icon(Icons.apple_rounded, color: Colors.redAccent, size: 26),
                        Icon(Icons.eco_rounded, color: AppColors.primary, size: 26),
                        Icon(Icons.local_drink_rounded, color: Colors.blueAccent, size: 26),
                      ],
                    ),
                    Divider(height: 1, color: AppColors.primary.withAlpha(40)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Icon(Icons.bakery_dining_rounded, color: Colors.amber, size: 26),
                        Icon(Icons.egg_outlined, color: Colors.orange, size: 26),
                        Icon(Icons.fastfood_rounded, color: Colors.green, size: 26),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Shopper with Cart
            Positioned(
              bottom: 35,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Shopper Avatar
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.person, color: Colors.white, size: 30),
                  ),
                  const SizedBox(width: 8),
                  // Cart Icon
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: AppColors.softShadow,
                    ),
                    child: const Icon(
                      Icons.shopping_cart_rounded,
                      color: AppColors.primary,
                      size: 34,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingIllustration2 extends StatelessWidget {
  const OnboardingIllustration2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 280,
      decoration: BoxDecoration(
        color: const Color(0xFFFFF4E8),
        borderRadius: BorderRadius.circular(140),
      ),
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                color: const Color(0xFFFFE6CC),
                shape: BoxShape.circle,
              ),
            ),
            // Giant Grocery Bag
            Container(
              width: 140,
              height: 150,
              decoration: BoxDecoration(
                color: const Color(0xFFD49C65),
                borderRadius: BorderRadius.circular(16),
                boxShadow: AppColors.softShadow,
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Produce peeking out of bag
                  Positioned(
                    top: -24,
                    left: 14,
                    child: const Icon(Icons.bakery_dining_rounded,
                        color: Color(0xFF8B4513), size: 40),
                  ),
                  Positioned(
                    top: -28,
                    right: 20,
                    child: const Icon(Icons.eco_rounded,
                        color: AppColors.primary, size: 46),
                  ),
                  Positioned(
                    top: -15,
                    left: 55,
                    child: const Icon(Icons.apple_rounded,
                        color: Colors.redAccent, size: 36),
                  ),
                  // Discount badge on bag
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        '30% OFF',
                        style: TextStyle(
                          color: AppColors.badgeOrange,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Happy Family icons
            Positioned(
              bottom: 20,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: AppColors.softShadow,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.face_6_rounded, color: AppColors.textPrimary, size: 22),
                    SizedBox(width: 4),
                    Icon(Icons.child_care_rounded, color: AppColors.primary, size: 20),
                    SizedBox(width: 4),
                    Icon(Icons.face_3_rounded, color: AppColors.textPrimary, size: 22),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingIllustration3 extends StatelessWidget {
  const OnboardingIllustration3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 280,
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        borderRadius: BorderRadius.circular(140),
      ),
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                color: const Color(0xFFD6EEDD),
                shape: BoxShape.circle,
              ),
            ),
            // Courier Delivery Box & Van
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 30 min badge
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: AppColors.softShadow,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.flash_on_rounded, color: Colors.yellowAccent, size: 18),
                      SizedBox(width: 4),
                      Text(
                        'Delivery in 30 min',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                // Delivery Courier & Box Graphic
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: AppColors.softShadow,
                      ),
                      child: const Icon(
                        Icons.delivery_dining_rounded,
                        color: AppColors.primary,
                        size: 42,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Icon(
                      Icons.arrow_forward_rounded,
                      color: AppColors.primary,
                      size: 24,
                    ),
                    const SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: AppColors.softShadow,
                      ),
                      child: const Icon(
                        Icons.home_rounded,
                        color: AppColors.textPrimary,
                        size: 42,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
