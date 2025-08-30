import 'package:restaurant_app/data/models/request/request.dart';

sealed class RestaurantListResultState {}

class ListNoneState extends RestaurantListResultState {}

class ListLoadingState extends RestaurantListResultState {}

class ListErrorState extends RestaurantListResultState {
  final String error;

  ListErrorState(this.error);
}

class ListLoadedState extends RestaurantListResultState {
  final List<RestaurantList> data;

  ListLoadedState(this.data);
}
