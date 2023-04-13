import 'package:firebase_auth/firebase_auth.dart';
import 'package:fively_ecommerce/controllers/auth_controller.dart';
import 'package:fively_ecommerce/services/auth.dart';
import 'package:fively_ecommerce/views/pages/auth_page.dart';
import 'package:fively_ecommerce/views/pages/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User?>(
        stream: auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final user = snapshot.data;
            if (user == null) {
              return ChangeNotifierProvider<AuthController>(
                  create: (context) => AuthController(authBase: auth),
                  child: const AuthPage(),);
            }
            return ChangeNotifierProvider(
                create: (context) => AuthController(authBase: auth),
              child: const BottomNavBar(),
            );
          }
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
