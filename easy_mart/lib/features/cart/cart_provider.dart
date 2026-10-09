import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/cart_item.dart';
import '../../data/models/product.dart';
import '../../core/constants/app_constants.dart';

class CartState {
  final List<CartItem> items;
  final String? appliedCoupon;
  final double discountAmount;

  const CartState({
    this.items = const [],
    this.appliedCoupon,
    this.discountAmount = 0.0,
  });

  double get subtotal =>
      items.fold(0.0, (sum, item) => sum + item.totalPrice);

  double get deliveryFee {
    if (items.isEmpty) return 0.0;
    if (subtotal >= AppConstants.freeDeliveryThreshold) return 0.0;
    return AppConstants.standardDeliveryFee;
  }

  double get total {
    if (items.isEmpty) return 0.0;
    final totalAfterDiscount = subtotal - discountAmount;
    final calc = (totalAfterDiscount > 0 ? totalAfterDiscount : 0.0) + deliveryFee;
    return double.parse(calc.toStringAsFixed(2));
  }

  int get totalCount =>
      items.fold(0, (count, item) => count + item.quantity);

  bool isInCart(String productId) =>
      items.any((item) => item.product.id == productId);

  int getQuantity(String productId, [String? unit]) {
    try {
      if (unit != null) {
        return items
            .firstWhere((item) =>
                item.product.id == productId && item.selectedUnit == unit)
            .quantity;
      }
      return items.firstWhere((item) => item.product.id == productId).quantity;
    } catch (_) {
      return 0;
    }
  }

  CartState copyWith({
    List<CartItem>? items,
    String? appliedCoupon,
    double? discountAmount,
    bool clearCoupon = false,
  }) {
    return CartState(
      items: items ?? this.items,
      appliedCoupon:
          clearCoupon ? null : (appliedCoupon ?? this.appliedCoupon),
      discountAmount:
          clearCoupon ? 0.0 : (discountAmount ?? this.discountAmount),
    );
  }
}

class CartNotifier extends StateNotifier<CartState> {
  CartNotifier() : super(const CartState());

  void addToCart(Product product, {int quantity = 1, String? unit}) {
    final targetUnit = unit ?? product.unit;
    final existingIndex = state.items.indexWhere(
      (item) => item.product.id == product.id && item.selectedUnit == targetUnit,
    );

    if (existingIndex >= 0) {
      final updatedList = List<CartItem>.from(state.items);
      final currentItem = updatedList[existingIndex];
      updatedList[existingIndex] = currentItem.copyWith(
        quantity: currentItem.quantity + quantity,
        selectedUnit: targetUnit,
      );
      state = state.copyWith(items: updatedList);
    } else {
      state = state.copyWith(
        items: [
          ...state.items,
          CartItem(
            product: product,
            quantity: quantity,
            selectedUnit: targetUnit,
          ),
        ],
      );
    }
    _recalculateDiscount();
  }

  void updateQuantity(String productId, int newQuantity, {String? unit}) {
    if (newQuantity <= 0) {
      removeFromCart(productId, unit: unit);
      return;
    }

    final updatedList = state.items.map((item) {
      final isMatch = item.product.id == productId &&
          (unit == null || item.selectedUnit == unit);
      if (isMatch) {
        return item.copyWith(quantity: newQuantity);
      }
      return item;
    }).toList();

    state = state.copyWith(items: updatedList);
    _recalculateDiscount();
  }

  void removeFromCart(String productId, {String? unit}) {
    state = state.copyWith(
      items: state.items.where((item) {
        if (unit != null) {
          return !(item.product.id == productId && item.selectedUnit == unit);
        }
        return item.product.id != productId;
      }).toList(),
    );
    _recalculateDiscount();
  }

  void clearCart() {
    state = const CartState();
  }

  bool applyCoupon(String code) {
    final cleanCode = code.trim().toUpperCase();
    if (AppConstants.demoCoupons.containsKey(cleanCode)) {
      final couponVal = AppConstants.demoCoupons[cleanCode]!;
      double discount = 0.0;
      if (couponVal < 1.0) {
        discount = state.subtotal * couponVal;
      } else {
        discount = couponVal;
      }
      state = state.copyWith(
        appliedCoupon: cleanCode,
        discountAmount: double.parse(discount.toStringAsFixed(2)),
      );
      return true;
    }
    return false;
  }

  void removeCoupon() {
    state = state.copyWith(clearCoupon: true);
  }

  void _recalculateDiscount() {
    if (state.appliedCoupon != null) {
      applyCoupon(state.appliedCoupon!);
    }
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, CartState>((ref) {
  return CartNotifier();
});
