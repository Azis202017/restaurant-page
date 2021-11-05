import 'package:flutter/material.dart';
import 'package:restaurant_app/models/restaurant.dart';

Widget buildRestaurantWidget(BuildContext context, Restaurant restaurant) {
  return Container(
    margin: const EdgeInsets.only(top: 24),
    child: ListTile(
      onTap: () {
        Navigator.pushNamed(context, '/detail-restaurant',
            arguments: restaurant);
      },
      title: Container(
        margin: const EdgeInsets.only(
          left: 4,
        ),
        child: Text(
          restaurant.namaRestaurant,
        ),
      ),
      subtitle: Container(
        margin: const EdgeInsets.only(
          top: 4,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.location_on_sharp,
                ),
                Text(
                  restaurant.alamatRestaurant,
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 8,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.red,
                  ),
                  Text(
                    '${restaurant.ratings}',
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(
          8,
        ),
        child: Image.asset(
          restaurant.gambarRestaurant,
        ),
      ),
    ),
  );
}
