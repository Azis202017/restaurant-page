import 'package:flutter/material.dart';
import 'package:restaurant_app/models/restaurant.dart';

class DetailRestaurant extends StatelessWidget {
  final Restaurant restaurant;
  // ignore: use_key_in_widget_constructors
  const DetailRestaurant(this.restaurant);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        restaurant.gambarRestaurant,
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(
                      context,
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 56,
                      left: 24,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: const Color.fromRGBO(
                        0,
                        0,
                        0,
                        0.5,
                      ),
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
              ),
              child: Text(
                restaurant.namaRestaurant,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 8.0,
                ),
                const Icon(
                  Icons.location_on_sharp,
                ),
                Text(
                  restaurant.alamatRestaurant,
                )
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
              ),
              child: Text(
                restaurant.description,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: restaurant.listMenu.length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                          right: 8.0,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            8,
                          ),
                          child: Image.asset(
                            '${restaurant.listMenu[index]['gambarmenu']}',
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 24.0,
                              ),
                              child: Text(
                                restaurant.listMenu[index]['namamenu'],
                                style: const TextStyle(
                                  fontFamily: 'AirbnbCerealBold',
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 24.0,
                                bottom: 16,
                              ),
                              child: Text(
                                "Rp : ${restaurant.listMenu[index]['harga']}",
                                style: const TextStyle(
                                  fontFamily: 'AirbnbCerealBook',
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                scrollDirection: Axis.horizontal,
              ),
            )
          ],
        ),
      ),
    );
  }
}
