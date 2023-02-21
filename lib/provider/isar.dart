import 'package:catering_management/models/dish.dart';
import 'package:catering_management/models/ingredient.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

final isarProvider = Provider((ref) async {
  final isar = await Isar.open([
    IngredientSchema,
    IngredientCategorySchema,
    DishSchema,
    

  ]);
  return isar;
});
