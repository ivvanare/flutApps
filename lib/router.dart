import 'package:flut_apps/pages/index.dart';
import 'package:flutter/material.dart';

class RoutesNames {
  static String home = '/home';
  static String kycWithOcrRoute = '/KycWithOCR';

  static Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    home: (BuildContext context) => const HomePage(),
    kycWithOcrRoute: (BuildContext context) => const KycWithOcrPage(),
  };
}
