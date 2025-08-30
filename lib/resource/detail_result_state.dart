import 'package:restaurant_app/data/models/request/detail_request.dart';

sealed class RestaurantDetailResultState {}

class DetailNoneState extends RestaurantDetailResultState {}

class DetailLoadingState extends RestaurantDetailResultState {}

class DetailErrorState extends RestaurantDetailResultState {
  final String error;

  DetailErrorState(this.error);
}

class DetailLoadedState extends RestaurantDetailResultState {
  final RestaurantDetail data;

  DetailLoadedState(this.data);
}
