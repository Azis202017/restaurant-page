import 'package:flutter/material.dart';
import 'package:restaurant_app/models/restaurant.dart';
import 'package:restaurant_app/pages/detail_restaurant.dart';
import 'package:restaurant_app/pages/list_restaurant_screen.dart';
import 'package:restaurant_app/pages/onboarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? screenAwal;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  screenAwal = preferences.getInt('initialScreen');
  await preferences.setInt('initialScreen', 1);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: screenAwal == 0 || screenAwal == null ? '/' : 'list-restaurant',
      routes: {
        '/' : (context) =>  const OnBoarding() ,
        '/list-restaurant': (
          context,
        ) =>
            const ListRestaurant(),
        
        '/detail-restaurant': (
          context,
        ) =>
            DetailRestaurant(
              ModalRoute.of(context)?.settings.arguments as Restaurant,
            ),
      },
    );
  }
}
