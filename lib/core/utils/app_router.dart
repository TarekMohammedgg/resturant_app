import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:resturant_app/screens/authentication/login_screen.dart';
import 'package:resturant_app/screens/authentication/register_screen.dart';
import 'package:resturant_app/screens/cart/cart_screen.dart';
import 'package:resturant_app/screens/menu/menu_screen.dart';

abstract class AppRouter {
  static const kMenuScreen = '/MenuScreen';
  static const kLoginScreen = '/';
  static const kRegisterScreenn = '/RegisterScreen';
  static const kCartScreen = '/CartScreen';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kLoginScreen,
        builder: (context, state) => (FirebaseAuth.instance.currentUser != null)
            ? MenuScreen()
            : LoginScreen(),
      ),
      GoRoute(path: kMenuScreen, builder: (context, state) => MenuScreen()),
      GoRoute(path: kCartScreen, builder: (context, state) => CartScreen()),
      GoRoute(
        path: kRegisterScreenn,
        builder: (context, state) => RegisterScreen(),
      ),
    ],
  );
}
