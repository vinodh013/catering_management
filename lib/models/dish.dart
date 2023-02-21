// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';

part 'dish.g.dart';

@collection
class Dish {
  Id id = Isar.autoIncrement;

  String name;

  List<DishIngredient> ingredients;

  Dish({
    required this.name,
    required this.ingredients,
  });
}

@embedded
class DishIngredient {
  
  String? name;
  int? value;
  String? unit;
  DishIngredient({
     
    this.name,
    this.value,
    this.unit,
  });
}

// @collection
// class DishCategory {
//   Id id = Isar.autoIncrement;
//   String name;
//   DishCategory({
//     required this.name,
//   });
// }
