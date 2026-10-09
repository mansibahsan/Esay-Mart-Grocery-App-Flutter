import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';
import '../../data/repositories/mock_data.dart';
import '../../shared_widgets/product_card.dart';
import '../../shared_widgets/section_header.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final PageController _bannerController = PageController();
  int _currentBannerIndex = 0;
  String _selectedCategory = 'Vegetables';

  @override
  void dispose() {
    _bannerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dealsProducts =
        MockData.products.where((p) => p.hasDiscount).toList();
    final categoryProducts = MockData.products
        .where((p) =>
            _selectedCategory == 'All' || p.category == _selectedCategory)
        .toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Top App Bar with Location and Notification
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                child: Row(
                  children: [
                    // Location Icon
                    // Location Selector (tap to manage addresses)
                    Expanded(
                      child: InkWell(
                        onTap: () => context.push('/addresses'),
                        borderRadius: BorderRadius.circular(10),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: AppColors.primaryLight,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.location_on_rounded,
                                color: AppColors.primary,
                                size: 22,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Deliver to',
                                        style: GoogleFonts.inter(
                                          fontSize: 11,
                                          color: AppColors.textMuted,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      const Icon(Icons.keyboard_arrow_down_rounded,
                                          size: 16,
                                          color: AppColors.textSecondary),
                                    ],
                                  ),
                                  Text(
                                    MockData.defaultAddress.fullAddress,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Notification Bell with Badge
                    Stack(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.notifications_none_rounded,
                              color: AppColors.textPrimary, size: 26),
                          onPressed: () => context.push('/notifications'),
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Search Bar Button
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                child: InkWell(
                  onTap: () => context.push('/search'),
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.border),
                      boxShadow: AppColors.softShadow,
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.search_rounded,
                            color: AppColors.textSecondary, size: 22),
                        const SizedBox(width: 12),
                        Text(
                          'Search fresh groceries, fruits, milk...',
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: AppColors.textMuted,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Promotional Banners Carousel
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Column(
                  children: [
                    SizedBox(
                      height: 155,
                      child: PageView.builder(
                        controller: _bannerController,
                        itemCount: MockData.promoBanners.length,
                        onPageChanged: (idx) {
                          setState(() {
                            _currentBannerIndex = idx;
                          });
                        },
                        itemBuilder: (context, index) {
                          final banner = MockData.promoBanners[index];
                          final bannerColor =
                              Color(int.parse(banner['colorHex']!));
                          final imageUrl = banner['imageUrl'];

                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            child: GestureDetector(
                              onTap: () {
                                context.push(
                                    '/search?category=${Uri.encodeComponent(banner['category']!)}');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: bannerColor,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: bannerColor.withAlpha(75),
                                      blurRadius: 14,
                                      offset: const Offset(0, 5),
                                    ),
                                  ],
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: Stack(
                                  children: [
                                    // Multi-tone base gradient
                                    Positioned.fill(
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              bannerColor,
                                              Color.lerp(bannerColor, Colors.black, 0.22)!,
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),

                                    // Right-side food image with soft fade shader mask
                                    if (imageUrl != null && imageUrl.isNotEmpty)
                                      Positioned(
                                        right: 0,
                                        top: 0,
                                        bottom: 0,
                                        width: 175,
                                        child: ShaderMask(
                                          shaderCallback: (rect) {
                                            return const LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                Colors.transparent,
                                                Colors.white38,
                                                Colors.white,
                                              ],
                                              stops: [0.0, 0.35, 1.0],
                                            ).createShader(rect);
                                          },
                                          blendMode: BlendMode.dstIn,
                                          child: Image.network(
                                            imageUrl,
                                            fit: BoxFit.cover,
                                            errorBuilder: (ctx, err, st) =>
                                                const SizedBox(),
                                          ),
                                        ),
                                      ),

                                    // Foreground text and CTA
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 18, vertical: 14),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          // Tag chip
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 9, vertical: 3.5),
                                            decoration: BoxDecoration(
                                              color: Colors.white.withAlpha(50),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                color: Colors.white.withAlpha(80),
                                                width: 0.8,
                                              ),
                                            ),
                                            child: Text(
                                              banner['tag']!,
                                              style: GoogleFonts.poppins(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                letterSpacing: 0.3,
                                              ),
                                            ),
                                          ),

                                          // Title and Subtitle
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 175,
                                                child: Text(
                                                  banner['title']!,
                                                  maxLines: 2,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.white,
                                                    height: 1.25,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 3),
                                              SizedBox(
                                                width: 165,
                                                child: Text(
                                                  banner['subtitle']!,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.inter(
                                                    fontSize: 11,
                                                    color: Colors.white
                                                        .withAlpha(220),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),

                                          // CTA Button
                                          ElevatedButton(
                                            onPressed: () {
                                              context.push(
                                                  '/search?category=${Uri.encodeComponent(banner['category']!)}');
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.white,
                                              foregroundColor: bannerColor,
                                              elevation: 2,
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 14, vertical: 7),
                                              minimumSize: Size.zero,
                                              tapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(14),
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  banner['buttonText']!,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 11,
                                                    fontWeight:
                                                        FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(width: 4),
                                                const Icon(
                                                    Icons.arrow_forward_rounded,
                                                    size: 12),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Indicator dots
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        MockData.promoBanners.length,
                        (index) => Container(
                          width: _currentBannerIndex == index ? 20 : 6,
                          height: 6,
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                            color: _currentBannerIndex == index
                                ? AppColors.primary
                                : AppColors.border,
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Categories Row
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SectionHeader(
                    title: 'Categories',
                    onAction: () => context.push('/categories'),
                  ),
                  SizedBox(
                    height: 105,
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      scrollDirection: Axis.horizontal,
                      itemCount: MockData.categories.length,
                      separatorBuilder: (context, index) => const SizedBox(width: 14),
                      itemBuilder: (context, index) {
                        final cat = MockData.categories[index];
                        final isSelected = _selectedCategory == cat.name;

                        return InkWell(
                          onTap: () {
                            setState(() {
                              _selectedCategory = cat.name;
                            });
                          },
                          borderRadius: BorderRadius.circular(16),
                          child: Column(
                            children: [
                              Container(
                                width: 62,
                                height: 62,
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? AppColors.primary
                                      : cat.backgroundColor,
                                  borderRadius: BorderRadius.circular(18),
                                  border: Border.all(
                                    color: isSelected
                                        ? AppColors.primary
                                        : AppColors.borderSubtle,
                                  ),
                                ),
                                child: Icon(
                                  cat.icon,
                                  color: isSelected
                                      ? Colors.white
                                      : AppColors.primary,
                                  size: 28,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                cat.name,
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.w500,
                                  color: isSelected
                                      ? AppColors.primary
                                      : AppColors.textPrimary,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Best Deals / Popular Products Horizontal List
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SectionHeader(
                    title: 'Best Deals & Discounts 🔥',
                    onAction: () => context.push('/search'),
                  ),
                  SizedBox(
                    height: 255,
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      scrollDirection: Axis.horizontal,
                      itemCount: dealsProducts.length,
                      separatorBuilder: (context, index) => const SizedBox(width: 14),
                      itemBuilder: (context, index) {
                        return ProductCard(
                          product: dealsProducts[index],
                          width: 165,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Filtered Category Grid
            SliverToBoxAdapter(
              child: SectionHeader(
                title: 'Fresh $_selectedCategory',
                onAction: () => context.push(
                    '/search?category=${Uri.encodeComponent(_selectedCategory)}'),
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 14,
                  childAspectRatio: 0.64,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return ProductCard(product: categoryProducts[index]);
                  },
                  childCount: categoryProducts.length,
                ),
              ),
            ),

            // Bottom space
            const SliverToBoxAdapter(
              child: SizedBox(height: 90),
            ),
          ],
        ),
      ),
    );
  }
}
