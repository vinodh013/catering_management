import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:catering_management/features/recipe/widgets/unit_textfield.dart';
import 'package:catering_management/models/dish.dart';
import '../../provider/isar.dart';

List<DishIngredient> _ingredientslist = [
  DishIngredient(),
];

class AddRecipe extends ConsumerStatefulWidget {
  const AddRecipe({super.key});

  @override
  ConsumerState<AddRecipe> createState() => _AddRecipeState();
}

class _AddRecipeState extends ConsumerState<AddRecipe> {
  TextEditingController dishNameController = TextEditingController();

  addDish(String name, List<DishIngredient> ingredients) async {
    var isar = await ref.read(isarProvider);

    isar.writeTxn(() async {
      await isar.dishs.put(Dish(name: name, ingredients: ingredients));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text('Add Dish',
              style: TextStyle(
                  color: Colors.black38,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: dishNameController,
            decoration: const InputDecoration(
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            ' Add Ingredients',
            style: TextStyle(
                color: Colors.black38,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 4),
                child: Text(
                  'Name',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              Text(
                'Qunatity',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              SizedBox()
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: _ingredientslist.length,
            itemBuilder: (context, index) {
              if (_ingredientslist.isEmpty) {
                return const Center(
                  child: Text('no ingrdient'),
                );
              }
              return DishIngredienField(
                index: index,
                dishIngrdient: _ingredientslist[index],
              );
            },
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _ingredientslist.add(DishIngredient());
              });
            },
            child: const Text('Add ingredients'),
          ),
          Row(
            children: [
              ElevatedButton(onPressed: () {}, child: Text('clear')),
              ElevatedButton(
                onPressed: () {
                  addDish(dishNameController.text, _ingredientslist);
                },
                child: const Text('Save'),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class DishIngredienField extends StatefulWidget {
  const DishIngredienField({
    Key? key,
    required this.dishIngrdient,
    required this.index,
  }) : super(key: key);

  final DishIngredient dishIngrdient;
  final int index;

  @override
  State<DishIngredienField> createState() => _DishIngredienFieldState();
}

class _DishIngredienFieldState extends State<DishIngredienField> {



  TextEditingController nameController = TextEditingController();

  TextEditingController valueController = TextEditingController();

  TextEditingController unitController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // add();
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 200,
            height: 50,
            child: DropdownMenu(
                controller: nameController,
                onSelected: (value) {
                  widget.dishIngrdient.name = nameController.text;
                },
                trailingIcon: const SizedBox(
                  width: 1,
                ),
                selectedTrailingIcon: const SizedBox(
                  width: 1,
                ),
                enableFilter: true,
                width: 200,
                inputDecorationTheme: const InputDecorationTheme(
                  suffixIconColor: Colors.transparent,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                dropdownMenuEntries: const [
                  DropdownMenuEntry(value: 1, label: 'hello'),
                  DropdownMenuEntry(value: 2, label: 'BOLO'),
                ]),
          ),
          UnitTextField(
              dishIngrdient: widget.dishIngrdient,
              unitController: unitController,
              valueController: valueController),
          IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                setState(() {
                  _ingredientslist.removeAt(widget.index);
                });
              },
              icon: const Icon(Icons.delete_outline))
        ],
      ),
    );
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   nameController.dispose();
  //   unitController.dispose();
  //   valueController.dispose();
  // }
}
