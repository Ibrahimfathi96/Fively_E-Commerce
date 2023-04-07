import 'package:fively_ecommerce/utilities/router.dart';
import 'package:fively_ecommerce/utilities/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FivelyEcommerce());
}

class FivelyEcommerce extends StatelessWidget {
  const FivelyEcommerce({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fively ECommerce',
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          labelStyle: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.black54),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(
              color: Colors.grey
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(
              color: Colors.grey
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(
              color: Colors.grey
            ),
          ),
        ),
        scaffoldBackgroundColor: const Color(0xffE5E5E5),
        primaryColor: const Color(0xffDB3022)
      ),
      onGenerateRoute: onGenerateRoutes,
      initialRoute: AppRoutes.authPageRouteName,
    );
  }
}

