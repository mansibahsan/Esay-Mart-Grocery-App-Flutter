# Easy Mart — Grocery & Super Shop Flutter App

A modern, high-performance grocery shopping application built with **Flutter 3**, **Riverpod**, and **GoRouter**, modeled after the **Grocery & Super Shop App UI Kit**.

---

## 🎨 Visual Identity & Design System

- **Primary Brand Color**: `#2E9E4D` (Fresh Emerald Green)
- **Background**: Soft Mint tint (`#E9F5EC`) for onboarding backdrops and crisp white (`#FFFFFF`) cards
- **Typography**:
  - Headings: Rounded, friendly sans-serif (**Poppins**)
  - Body & UI: Clean, legible sans-serif (**Inter**)
- **Buttons**: Pill/stadium shaped solid green fill with bold white typography
- **Cards**: Soft 16px rounded corners with ambient drop shadows

---

## 📱 Features & Screens Implemented

1. **Onboarding Carousel (Matching Mockup Screenshot)**
   - 3 slides:
     - *Slide 1*: "Browse all the Category"
     - *Slide 2*: "Amazing Discounts & Offers"
     - *Slide 3*: "Delivery in 30 min"
   - Numbered step indicators (`1  2  3`) with animated active state
   - Pill-shaped "Get Start" CTA button
   - Skip button with `SharedPreferences` persistence (`has_seen_onboarding`)

2. **Authentication Flow**
   - **Sign In**: Email/phone, password toggle, "Continue as Guest", social login buttons
   - **Sign Up**: Full name, email, phone, password, terms checkbox
   - **Phone OTP Verification**: 4-pin auto-focusing numeric input fields with resend timer
   - **Forgot Password**: Password reset link dispatch

3. **Main Shell & Bottom Navigation**
   - Persistent `BottomNavigationBar` with 5 tabs: **Home**, **Categories**, **Cart**, **Orders**, **Profile**
   - Dynamic real-time cart badge counter

4. **Home Feed**
   - Location address header (`Deliver to: Home - Gulshan-2...`) + Notification bell
   - Instant search trigger
   - Promotional discount carousel (`30% OFF`, `Express Delivery`, `Morning Bakery`)
   - Horizontal category chips with quick filtering
   - "Best Deals & Discounts" horizontal product cards
   - "Fresh Vegetables & Fruits" responsive 2-column grid

5. **Category Browsing**
   - Pastel-tinted 2-column category directory (Vegetables, Fruits, Dairy, Bakery, Meat, Beverages)
   - Deep-linking directly into filtered category search

6. **Search & Filter**
   - Real-time instant query filtering across names and categories
   - Horizontal category filter pills
   - Sort bottom sheet (Price: Low to High, High to Low, Top Rated, Popular)

7. **Product Details Screen**
   - Hero transition image showcase
   - Discount tag, rating, stock status, unit/weight selector (`250g`, `500g`, `1kg`)
   - Nutritional facts table (Calories, Protein, Carbs, Vitamins)
   - "You May Also Like" related product suggestions
   - Sticky bottom bar with `[-] quantity [+]` stepper & "Add to Cart" action

8. **Shopping Cart & Coupons**
   - Swipe-to-delete dismissible items
   - Free delivery threshold progress bar (Free delivery over $35)
   - Interactive coupon discount engine (try `FRESH30` for 30% OFF or `SAVE10` for 10% OFF)
   - Bill details breakdown (Subtotal, Delivery Fee, Discount, Total)

9. **Checkout Flow**
   - Delivery address selector (Home, Office)
   - Delivery time-slot picker with highlighted **Express Delivery (Within 30 min) ⚡**
   - Payment method selection: Cash on Delivery, Credit/Debit Card, Mobile Banking (bKash)
   - Order placement with instant order creation

10. **Order Confirmation & Tracking**
    - Success checkmark banner with live countdown ("Arriving in 24 mins")
    - Courier rider info card with direct call action
    - 4-stage vertical order timeline:
      - `1. Order Placed`
      - `2. Packed at Super Shop`
      - `3. Out for Delivery`
      - `4. Delivered`

11. **User Profile & Order History**
    - Account details, past orders list with reorder/track actions
    - Saved addresses, vouchers, customer support dialog

---

## 🛠️ Tech Stack & Packages

- **Framework**: Flutter 3 (Dart null-safety)
- **State Management**: `flutter_riverpod: ^2.6.1`
- **Routing**: `go_router: ^17.5.0`
- **Typography**: `google_fonts: ^8.2.1`
- **Image Caching**: `cached_network_image: ^3.4.1`
- **Persistence**: `shared_preferences: ^2.5.5`
- **Formatting**: `intl: ^0.20.3`

---

## 🚀 How to Run

Navigate into the `easy_mart` directory:

```bash
cd easy_mart
```

Run on Chrome (Web):
```bash
flutter run -d chrome
```

Run on Windows Desktop:
```bash
flutter run -d windows
```

Run tests:
```bash
flutter test
```
