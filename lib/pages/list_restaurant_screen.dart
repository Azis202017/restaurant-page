import 'package:flutter/material.dart';
import '../models/restaurant.dart';
import '../widgets/list_restaurantwidget.dart';

class ListRestaurant extends StatelessWidget {
  const ListRestaurant({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder<String>(
            future: DefaultAssetBundle.of(context).loadString(
              'assets/json/restaurant.json',
            ),
            builder: (context, snapshot) {
              final List<Restaurant> restaurant = parseRestaurant(
                snapshot.data,
              );

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 16,
                    ),
                    child: Text(
                      'Restaurant',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 16,
                    ),
                    child: Text(
                      'Recommended restaurant for you',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Container(
                    height: 800,
                    margin: const EdgeInsets.only(
                      top: 32,
                    ),
                    child: ListView.builder(
                      itemCount: restaurant.length,
                      itemBuilder: (context, index) {
                        return buildRestaurantWidget(
                          context,
                          restaurant[index],
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
