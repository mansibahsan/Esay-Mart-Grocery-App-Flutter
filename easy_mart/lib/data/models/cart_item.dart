import 'product.dart';

class CartItem {
  final Product product;
  int quantity;
  String selectedUnit;

  CartItem({
    required this.product,
    this.quantity = 1,
    String? selectedUnit,
  }) : selectedUnit = selectedUnit ?? product.unit;

  double get unitPrice => product.currentPriceForUnit(selectedUnit);

  double get totalPrice => unitPrice * quantity;

  CartItem copyWith({
    Product? product,
    int? quantity,
    String? selectedUnit,
  }) {
    return CartItem(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      selectedUnit: selectedUnit ?? this.selectedUnit,
    );
  }
}
