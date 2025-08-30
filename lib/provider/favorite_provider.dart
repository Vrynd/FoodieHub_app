import 'package:flutter/material.dart';
import 'package:restaurant_app/data/models/request/request.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<RestaurantList> _favorites = [];

  List<RestaurantList> get favorites => _favorites;

  void addBookmark(RestaurantList value) {
    _favorites.add(value);
    notifyListeners();
  }

  void removeBookmark(RestaurantList value) {
    _favorites.removeWhere((element) => element.id == value.id);
    notifyListeners();
  }

  bool checkItemFavorite(RestaurantList value) {
    final restoInList =
        _favorites.where((element) => element.id == value.id);
    return restoInList.isNotEmpty;
  }
}
