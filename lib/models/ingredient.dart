// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:isar/isar.dart';

part "ingredient.g.dart";

@collection
class Ingredient {
  Id id = Isar.autoIncrement;
  String name;
  String category;
  Ingredient({
    required this.name,
    required this.category,
  });
}

@collection
class IngredientCategory {
  Id id = Isar.autoIncrement;

  String name;
  IngredientCategory({
    required this.name,
  });
}
