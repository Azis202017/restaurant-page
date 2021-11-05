import 'dart:convert';

class Restaurant {
  late String namaRestaurant;
  late String alamatRestaurant;
  late double ratings;
  late String gambarRestaurant;
  late String description;
  late List listMenu;

  Restaurant({
    required this.namaRestaurant,
    required this.alamatRestaurant,
    required this.description,
    required this.ratings,
    required this.gambarRestaurant,
    required this.listMenu,
  });
  Restaurant.fromJson(Map<String, dynamic> resto) {
    namaRestaurant = resto['namarestaurant'];
    alamatRestaurant = resto['alamat'];
    ratings = resto['ratings'];
    gambarRestaurant = resto['gambarrestaurant'];
    description = resto['description'];
    listMenu = resto['listmenu'];
  }
}

List<Restaurant> parseRestaurant(String? json) {
  if (json == null) {
    return [];
  }
  final List parsed = jsonDecode(json);
  return parsed
      .map(
        (json) => Restaurant.fromJson(
          json,
        ),
      )
      .toList();
}
