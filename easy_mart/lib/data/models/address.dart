class Address {
  final String id;
  final String label; // "Home", "Office", "Apartment"
  final String fullAddress;
  final String city;
  final String recipientName;
  final String phone;
  final bool isDefault;

  const Address({
    required this.id,
    required this.label,
    required this.fullAddress,
    required this.city,
    required this.recipientName,
    required this.phone,
    this.isDefault = false,
  });

  Address copyWith({
    String? id,
    String? label,
    String? fullAddress,
    String? city,
    String? recipientName,
    String? phone,
    bool? isDefault,
  }) {
    return Address(
      id: id ?? this.id,
      label: label ?? this.label,
      fullAddress: fullAddress ?? this.fullAddress,
      city: city ?? this.city,
      recipientName: recipientName ?? this.recipientName,
      phone: phone ?? this.phone,
      isDefault: isDefault ?? this.isDefault,
    );
  }
}
