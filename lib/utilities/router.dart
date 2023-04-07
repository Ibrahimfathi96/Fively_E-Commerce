import 'package:fively_ecommerce/utilities/routes.dart';
import 'package:fively_ecommerce/views/pages/landing_page.dart';
import 'package:fively_ecommerce/views/pages/auth_page.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings){
  switch(settings.name){
    case AppRoutes.authPageRouteName:
      return MaterialPageRoute(builder: (_) => const AuthPage(),);
    case AppRoutes.landingPageRouteName:
    default:
      return MaterialPageRoute(builder: (_) => const LandingPage(),);
  }
}