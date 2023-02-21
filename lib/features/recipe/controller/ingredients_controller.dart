import 'package:catering_management/models/dish.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ingredientsNotifier extends Notifier<List<DishIngredient>> {
  @override
  build() {
    return [];
  }

  add() {
    state = [...state, DishIngredient()];
  }
}
