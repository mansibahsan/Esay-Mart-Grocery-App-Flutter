import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  String _selectedFilter = 'All';

  final List<Map<String, dynamic>> _allNotifications = [
    {
      'id': 'n1',
      'title': 'Order #EM-89241 Out for Delivery 🛵',
      'body':
          'Driver Mansib Ahsan’s rider is 5 minutes away with your fresh groceries!',
      'time': '5 mins ago',
      'type': 'order',
      'isUnread': true,
      'icon': Icons.delivery_dining_rounded,
      'color': Color(0xFF2E7D32),
      'route': '/orders',
    },
    {
      'id': 'n2',
      'title': 'Flash Sale: 30% Off Fresh Greens 🥬',
      'body':
          'Save 30% on organic broccoli and vine tomatoes today with code FRESH30.',
      'time': '2 hours ago',
      'type': 'promo',
      'isUnread': true,
      'icon': Icons.local_offer_rounded,
      'color': Color(0xFFE65100),
      'route': '/coupons',
    },
    {
      'id': 'n3',
      'title': 'Favorites Restocked! 🥑',
      'body':
          'Creamy Hass Avocados and Sweet Strawberries are back in fresh harvest stock.',
      'time': '1 day ago',
      'type': 'promo',
      'isUnread': false,
      'icon': Icons.favorite_rounded,
      'color': Color(0xFFD32F2F),
      'route': '/favorites',
    },
    {
      'id': 'n4',
      'title': 'Order #EM-84210 Delivered ✅',
      'body':
          'Your package was delivered to Apt 4B, Gulshan-2. How was your experience?',
      'time': '2 days ago',
      'type': 'order',
      'isUnread': false,
      'icon': Icons.check_circle_outline_rounded,
      'color': Color(0xFF1565C0),
      'route': '/orders',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filtered = _allNotifications.where((n) {
      if (_selectedFilter == 'Orders') return n['type'] == 'order';
      if (_selectedFilter == 'Promos') return n['type'] == 'promo';
      return true;
    }).toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                for (var n in _allNotifications) {
                  n['isUnread'] = false;
                }
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('All notifications marked as read.')),
              );
            },
            child: Text(
              'Mark Read',
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          // Filter Chips
          Container(
            color: AppColors.surface,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: ['All', 'Orders', 'Promos'].map((filter) {
                final isSel = _selectedFilter == filter;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(filter),
                    selected: isSel,
                    selectedColor: AppColors.primaryLight,
                    checkmarkColor: AppColors.primary,
                    labelStyle: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight:
                          isSel ? FontWeight.bold : FontWeight.normal,
                      color:
                          isSel ? AppColors.primary : AppColors.textPrimary,
                    ),
                    onSelected: (val) {
                      setState(() {
                        _selectedFilter = filter;
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          ),
          const Divider(height: 1, color: AppColors.borderSubtle),

          // List
          Expanded(
            child: filtered.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.notifications_off_outlined,
                            size: 56, color: AppColors.textMuted),
                        const SizedBox(height: 14),
                        Text(
                          'No notifications found',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: filtered.length,
                    separatorBuilder: (ctx, i) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final item = filtered[index];
                      final isUnread = item['isUnread'] as bool;
                      final color = item['color'] as Color;

                      return InkWell(
                        onTap: () {
                          setState(() {
                            item['isUnread'] = false;
                          });
                          if (item['route'] != null) {
                            context.push(item['route'] as String);
                          }
                        },
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: isUnread
                                ? AppColors.primaryLight.withAlpha(40)
                                : AppColors.surface,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: isUnread
                                  ? AppColors.primary.withAlpha(100)
                                  : AppColors.borderSubtle,
                            ),
                            boxShadow: AppColors.softShadow,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: color.withAlpha(25),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  item['icon'] as IconData,
                                  color: color,
                                  size: 24,
                                ),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            item['title'] as String,
                                            style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: isUnread
                                                  ? FontWeight.bold
                                                  : FontWeight.w600,
                                              color: AppColors.textPrimary,
                                            ),
                                          ),
                                        ),
                                        if (isUnread)
                                          Container(
                                            width: 8,
                                            height: 8,
                                            decoration: const BoxDecoration(
                                              color: AppColors.primary,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      item['body'] as String,
                                      style: GoogleFonts.inter(
                                        fontSize: 12,
                                        color: AppColors.textSecondary,
                                        height: 1.35,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      item['time'] as String,
                                      style: GoogleFonts.inter(
                                        fontSize: 11,
                                        color: AppColors.textMuted,
                                      ),
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
          ),
        ],
      ),
    );
  }
}
