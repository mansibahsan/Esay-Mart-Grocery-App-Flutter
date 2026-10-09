class Product {
  final String id;
  final String name;
  final String imageUrl;
  final List<String> images;
  final String unit; // e.g. "1 kg", "500 g", "1 bunch"
  final String category;
  final double price;
  final double discountPrice;
  final double rating;
  final int reviewsCount;
  final bool inStock;
  final String description;
  final Map<String, String>? nutritionalInfo;
  final List<String> availableUnits;

  const Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.images = const [],
    required this.unit,
    required this.category,
    required this.price,
    this.discountPrice = 0.0,
    this.rating = 4.8,
    this.reviewsCount = 42,
    this.inStock = true,
    required this.description,
    this.nutritionalInfo,
    this.availableUnits = const ['250g', '500g', '1kg'],
  });

  bool get hasDiscount => discountPrice > 0 && discountPrice < price;

  double get currentPrice => hasDiscount ? discountPrice : price;

  int get discountPercent {
    if (!hasDiscount) return 0;
    return (((price - discountPrice) / price) * 100).round();
  }

  List<String> get allImages {
    if (images.isNotEmpty) return images;
    if (imageUrl.isNotEmpty) return [imageUrl];
    return const [];
  }

  static double getUnitMultiplier(String targetUnit, String baseUnit) {
    if (targetUnit.toLowerCase().trim() == baseUnit.toLowerCase().trim()) {
      return 1.0;
    }

    double? parseWeight(String str) {
      final s = str.toLowerCase().trim();
      final numRegex = RegExp(r'(\d+(?:\.\d+)?)');
      final match = numRegex.firstMatch(s);
      if (match == null) return null;
      final val = double.tryParse(match.group(1)!) ?? 1.0;

      if (s.contains('kg')) {
        return val * 1000;
      } else if (s.contains('g') && !s.contains('tray')) {
        return val;
      } else if (s.contains('liter') || s.contains('litre')) {
        return val * 1000;
      } else if (s.contains('ml')) {
        return val;
      } else if (s.contains('pcs') || s.contains('pc')) {
        return val;
      } else if (s.contains('loaf') || s.contains('loaves')) {
        return val;
      }
      return val;
    }

    final targetVal = parseWeight(targetUnit);
    final baseVal = parseWeight(baseUnit);

    if (targetVal != null && baseVal != null && baseVal > 0) {
      return targetVal / baseVal;
    }

    return 1.0;
  }

  double unitMultiplier(String selectedUnit) {
    return getUnitMultiplier(selectedUnit, unit);
  }

  double currentPriceForUnit(String selectedUnit) {
    return currentPrice * unitMultiplier(selectedUnit);
  }

  double originalPriceForUnit(String selectedUnit) {
    return price * unitMultiplier(selectedUnit);
  }

  Product copyWith({
    String? id,
    String? name,
    String? imageUrl,
    List<String>? images,
    String? unit,
    String? category,
    double? price,
    double? discountPrice,
    double? rating,
    int? reviewsCount,
    bool? inStock,
    String? description,
    Map<String, String>? nutritionalInfo,
    List<String>? availableUnits,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      images: images ?? this.images,
      unit: unit ?? this.unit,
      category: category ?? this.category,
      price: price ?? this.price,
      discountPrice: discountPrice ?? this.discountPrice,
      rating: rating ?? this.rating,
      reviewsCount: reviewsCount ?? this.reviewsCount,
      inStock: inStock ?? this.inStock,
      description: description ?? this.description,
      nutritionalInfo: nutritionalInfo ?? this.nutritionalInfo,
      availableUnits: availableUnits ?? this.availableUnits,
    );
  }
}
