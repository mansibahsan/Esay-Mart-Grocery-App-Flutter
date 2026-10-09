import 'cart_item.dart';
import 'address.dart';

enum OrderStatus {
  placed,
  packed,
  outForDelivery,
  delivered,
  cancelled;

  String get displayName {
    switch (this) {
      case OrderStatus.placed:
        return 'Order Placed';
      case OrderStatus.packed:
        return 'Packed at Store';
      case OrderStatus.outForDelivery:
        return 'Out for Delivery';
      case OrderStatus.delivered:
        return 'Delivered';
      case OrderStatus.cancelled:
        return 'Cancelled';
    }
  }

  int get stepIndex {
    switch (this) {
      case OrderStatus.placed:
        return 0;
      case OrderStatus.packed:
        return 1;
      case OrderStatus.outForDelivery:
        return 2;
      case OrderStatus.delivered:
        return 3;
      case OrderStatus.cancelled:
        return -1;
    }
  }
}

class Order {
  final String id;
  final List<CartItem> items;
  final double subtotal;
  final double deliveryFee;
  final double discount;
  final double total;
  final OrderStatus status;
  final DateTime placedAt;
  final Address deliveryAddress;
  final String paymentMethod;
  final String deliverySlot;
  final String estimatedDeliveryTime;

  const Order({
    required this.id,
    required this.items,
    required this.subtotal,
    required this.deliveryFee,
    required this.discount,
    required this.total,
    required this.status,
    required this.placedAt,
    required this.deliveryAddress,
    required this.paymentMethod,
    this.deliverySlot = 'Express Delivery (30 min)',
    this.estimatedDeliveryTime = '25 - 30 mins',
  });

  Order copyWith({
    String? id,
    List<CartItem>? items,
    double? subtotal,
    double? deliveryFee,
    double? discount,
    double? total,
    OrderStatus? status,
    DateTime? placedAt,
    Address? deliveryAddress,
    String? paymentMethod,
    String? deliverySlot,
    String? estimatedDeliveryTime,
  }) {
    return Order(
      id: id ?? this.id,
      items: items ?? this.items,
      subtotal: subtotal ?? this.subtotal,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      discount: discount ?? this.discount,
      total: total ?? this.total,
      status: status ?? this.status,
      placedAt: placedAt ?? this.placedAt,
      deliveryAddress: deliveryAddress ?? this.deliveryAddress,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      deliverySlot: deliverySlot ?? this.deliverySlot,
      estimatedDeliveryTime:
          estimatedDeliveryTime ?? this.estimatedDeliveryTime,
    );
  }
}
