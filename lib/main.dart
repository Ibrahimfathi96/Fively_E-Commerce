import 'package:fively_ecommerce/services/auth.dart';
import 'package:fively_ecommerce/utilities/router.dart';
import 'package:fively_ecommerce/utilities/routes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,);
  runApp(const FivelyEcommerce());
}

class FivelyEcommerce extends StatelessWidget {
  const FivelyEcommerce({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (context) => Auth(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fively ECommerce',
        theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
            errorStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.red),
            filled: true,
            fillColor: Colors.white,
            labelStyle: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.black54),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                color: Colors.grey
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide:const BorderSide(
                color: Colors.red
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide:const BorderSide(
                color: Colors.red
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
        initialRoute: AppRoutes.landingPageRouteName,
      ),
    );
  }
}

