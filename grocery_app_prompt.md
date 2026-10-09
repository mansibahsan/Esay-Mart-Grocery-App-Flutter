# Grocery & Super Shop App — Flutter Build Prompt

## Project Overview
Build a mobile grocery/super shop shopping app in **Flutter**, named **"Fresh Mart"** (placeholder — rename as needed). The app lets users browse categories, search products, add items to a cart, check out, and track delivery. Use the attached **Grocery & Super Shop App UI Kit** screenshots (onboarding, authentication, home, categories, product details, cart, checkout, order tracking, profile) as the visual/UX reference — clean cards, rounded corners, a green (#2E9E4D-ish) primary color on a light background, bold rounded headline typography, and soft pastel-green illustration accents.

## Tech Stack
- **Flutter** (latest stable), **Dart** null-safety
- **State management**: Riverpod (or Provider/Bloc — pick one and stay consistent)
- **Navigation**: go_router
- **Networking**: Dio + Retrofit (or plain http) against a REST/Firebase backend
- **Local storage**: Hive or shared_preferences (cart persistence, onboarding "seen" flag, auth token)
- **Backend options**: Firebase (Auth + Firestore + Storage) for a fast MVP, or a custom REST API if one already exists
- **Image caching**: cached_network_image
- **Payments**: Stripe/SSLCommerz/bKash placeholder integration (swap per market)

## Suggested Folder Structure
```
lib/
  core/            # theme, constants, routing, utils
  data/            # models, repositories, API/Firebase services
  features/
    onboarding/
    auth/
    home/
    categories/
    product_details/
    cart/
    checkout/
    orders/
    profile/
    search/
    favorites/
    notifications/
  widgets/         # shared/reusable widgets (buttons, cards, app bars)
main.dart
```

## Screens (mirroring the UI kit)

### 1. Onboarding (3 slides, matches uploaded screenshots)
- Slide 1: "Browse all the Category" — illustration of shopping categories
- Slide 2: "Amazing Discounts & Offers" — illustration of grocery bag + family
- Slide 3: "Delivery in 30 min" — illustration of delivery handoff
- Page indicator dots (1 2 3), green "Get Start" CTA button, skip option

### 2. Authentication
- Sign In (email/phone + password, "Forgot Password?", social login buttons)
- Sign Up (name, email/phone, password, confirm password, terms checkbox)
- OTP verification screen (for phone-based signup)
- Forgot/Reset password flow

### 3. Home
- Location selector + notification bell in top bar
- Search bar
- Promo/banner carousel (discount campaigns)
- Horizontal category chips/icons (Vegetables, Fruits, Dairy, Bakery, Meat, Beverages, etc.)
- "Popular Products" / "Best Deals" horizontal product lists
- Bottom navigation: Home, Categories, Cart, Orders, Profile

### 4. Categories
- Grid or list of all categories with icons/images
- Tapping a category opens filtered product list

### 5. Product Listing / Search Results
- Grid of product cards (image, name, price, "add to cart" quick-action)
- Filter & sort (price, rating, discount) and search bar with recent/suggested searches

### 6. Product Details
- Image carousel/gallery
- Name, price (with strike-through original price if discounted), unit/weight selector
- Description, nutritional info (optional), reviews/ratings
- Quantity stepper + "Add to Cart" sticky bottom button
- "You may also like" related products row

### 7. Cart
- List of items with thumbnail, name, unit price, quantity stepper, remove (swipe or icon)
- Order summary: subtotal, delivery fee, discount/coupon field, total
- "Proceed to Checkout" CTA

### 8. Checkout
- Delivery address selection/add new address (map pin optional)
- Delivery time slot picker ("Delivery in 30 min" express option)
- Payment method selection (card, cash on delivery, mobile wallet)
- Order review + "Place Order" button

### 9. Order Confirmation & Tracking
- Success animation/screen with order ID
- Order status timeline (Placed → Packed → Out for Delivery → Delivered)
- Live delivery tracking map (optional)
- Order history list in Profile

### 10. Profile
- User info + avatar
- Saved addresses, payment methods
- Order history, favorites/wishlist
- Notifications settings, help/support, logout

### 11. Empty & Utility States
- Empty cart, empty search results, empty favorites, no internet, loading skeletons

## Design Tokens (from reference UI kit)
- Primary color: green (~`#2E9E4D`)
- Background: white / very light mint green (~`#E9F5EC`) for onboarding backdrop
- Headline font: bold, rounded sans-serif (e.g., Poppins/Baloo 2)
- Body font: regular sans-serif (e.g., Inter/Roboto)
- Buttons: fully rounded (pill-shaped), solid green fill, white text
- Cards: rounded corners (~16px), soft drop shadow

## Core Features Checklist
- [ ] Onboarding flow with "seen" persistence (skip on relaunch)
- [ ] Auth (sign up, sign in, forgot password, optional OTP)
- [ ] Home feed with categories + promos + product lists
- [ ] Category browsing & product search with filters
- [ ] Product details with quantity/unit selection
- [ ] Cart with persistent state (Hive/shared_preferences) across app restarts
- [ ] Checkout with address + time slot + payment method
- [ ] Order placement, confirmation, and status tracking
- [ ] User profile (addresses, order history, favorites, logout)
- [ ] Push notifications for order updates (Firebase Cloud Messaging, optional)
- [ ] Light/Dark theme support (optional)

## Data Models (starting point)
```dart
class Product {
  final String id, name, imageUrl, unit, category;
  final double price, discountPrice;
  final double rating;
  final bool inStock;
}

class CartItem {
  final Product product;
  int quantity;
}

class Order {
  final String id;
  final List<CartItem> items;
  final double subtotal, deliveryFee, discount, total;
  final String status; // placed, packed, out_for_delivery, delivered
  final DateTime placedAt;
  final Address deliveryAddress;
  final String paymentMethod;
}

class Address {
  final String id, label, fullAddress;
  final double? lat, lng;
}

class AppUser {
  final String id, name, email, phone;
  final List<Address> addresses;
}
```

## Deliverable
A working Flutter app skeleton implementing the screens above with mock/sample data first, wired to real API/Firebase calls second, following the visual style of the reference UI kit.
