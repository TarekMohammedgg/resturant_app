# 🍽️ Flutter Restaurant App

A complete Flutter-based mobile application for a restaurant that allows users to browse menus, add items to a cart, and place orders. It uses Firebase for authentication and backend integration.

---

## 📱 Features

- 🔐 User Authentication (Login/Register with Firebase)
- 🧾 Dynamic Menu Display
- 🛒 Cart Management with State (Cubit)
- 💰 Order Summary & Checkout Flow
- 🔥 Firebase Integration
- 🎨 Responsive & Modular UI using custom widgets

---

## 🧱 Tech Stack

- **Flutter** (UI SDK)
- **Firebase** (Auth, Firestore if extended)
- **Bloc/Cubit** for state management
- **GoRouter** for navigation
- **Dart Models** for clean data handling

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK ≥ 3.0
- Dart ≥ 3.0
- Firebase account + configuration

### Installation

```bash
# Clone the repository
git clone https://github.com/TarekMohammedgg/resturant_app.git
cd flutter-restaurant-app

# Get dependencies
flutter pub get

# Run the app
flutter run
```

### Firebase Setup
1.Go to Firebase Console

2.Create a project

3.Enable Email/Password Authentication

4.Add Android/iOS apps and download google-services.json / GoogleService-Info.plist

5.Replace existing Firebase config or use firebase_options.dart from FlutterFire CLI

### File Structure 
```bash
lib/
├── core/
│   ├── cubits/              # State management
│   ├── models/              # Data models (CardItem, OrderItem)
│   └── utils/               # Routing, styles, assets
├── screens/
│   ├── authentication/      # Login & Register
│   ├── menu/                # Food menu screen
│   └── cart/                # Cart and order summary
├── services/                # Firebase interaction
├── widgets/                 # Reusable custom widgets
├── firebase_options.dart    # Firebase config
└── main.dart                # App entry point
```
