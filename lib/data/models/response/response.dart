import 'package:restaurant_app/data/models/request/request.dart';

class RestaurantListResponse {
  bool error;
  String message;
  int count;
  List<RestaurantList> restaurants;

  RestaurantListResponse({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurants,
  });

  factory RestaurantListResponse.fromJson(Map<String, dynamic> json) {
    return RestaurantListResponse(
      error: json["error"],
      message: json["message"],
      count: json["count"],
      restaurants: List<RestaurantList>.from(
        json["restaurants"].map((x) => RestaurantList.fromJson(x)),
      ),
    );
  }

  get resultState => null;
}
