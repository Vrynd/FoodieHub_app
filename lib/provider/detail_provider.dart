import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/resource/detail_result_state.dart';

class RestaurantDetailProvider extends ChangeNotifier {
  final ApiService _apiServices;
  RestaurantDetailProvider(this._apiServices);

  RestaurantDetailResultState _resultState = DetailNoneState();
  RestaurantDetailResultState get resultState => _resultState;

    Future<void> fetchRestaurantDetail(String id) async {
      try {
        _resultState = DetailLoadingState();
        notifyListeners();

        final result = await _apiServices.getDetailRestaurant(id);
        if (result.error) {
          _resultState = DetailErrorState(result.message);
          notifyListeners();
        } else {
          _resultState = DetailLoadedState(result.restaurant);
          notifyListeners();
        }
      } on Exception catch (e) {
        _resultState = DetailErrorState(e.toString());
        notifyListeners();
      }
    }
  }
