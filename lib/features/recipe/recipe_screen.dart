import 'package:catering_management/features/recipe/add_recipe.dart';
import 'package:catering_management/models/dish.dart';
import 'package:catering_management/models/ingredient.dart';
import 'package:catering_management/widgets/searchbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:multi_split_view/multi_split_view.dart';

import '../../provider/isar.dart';


class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(width: 500, child: AddRecipe()),
      body: AdaptiveLayout(
        body: SlotLayout(config: {
          Breakpoints.large: SlotLayout.from(
            key: const Key('large recipe body'),
            builder: (context) {
              return MultiSplitView(
                  initialAreas: [Area(weight: 0.8)],
                  resizable: false,
                  dividerBuilder: (axis, index, resizable, dragging,
                      highlighted, themeData) {
                    return const VerticalDivider();
                  },
                  children: const [RecipesList(), IngredientList()]);
            },
          )
        }),
      ),
    );
  }
}

class RecipesList extends ConsumerStatefulWidget {
  const RecipesList({super.key});

  @override
  ConsumerState<RecipesList> createState() => _RecipesListState();
}

class _RecipesListState extends ConsumerState<RecipesList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // addDish() async {
  //  var isar = await ref.read(isarProvider);

  //  isar.


  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 100),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                "Dishes",
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(width: 800, child: SearchBox()),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Total : 10'),
              TextButton.icon(
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                icon: const Icon(Icons.add),
                label: const Text('Add recipe'),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),



          Flexible(
            child: SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 20,
                controller: _scrollController,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: const Text('Hello'),
                    onTap: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}






























class IngredientList extends ConsumerStatefulWidget {
  const IngredientList({super.key});

  @override
  ConsumerState<IngredientList> createState() => _IngredientListState();
}

class _IngredientListState extends ConsumerState<IngredientList> {
  TextEditingController ingredientName = TextEditingController();
  TextEditingController ingredientCategory = TextEditingController();

 

  addIngredients(String name, String category) async {
    var isar = await ref.read(isarProvider);

    var newIngredient = Ingredient(name: name, category: category);

    isar.writeTxn(() async {
      await isar.ingredients.put(newIngredient);
    });
  }

  Future<List<Ingredient>> getingredients() async {
    var isar = await ref.read(isarProvider);

    var ingredient = isar.ingredients.where().findAll();

    return ingredient;
  }

  var v = false;
  var s = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Ingredient's",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(85, 155, 39, 176),
              ),
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    v = true;
                    s = false;
                  });
                },
                child: Text('Add'))
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Visibility(
            visible: v,
            child: Container(
              height: 200,
              child: Column(
                children: [
                  TextFormField(
                    controller: ingredientName,
                    decoration: InputDecoration(
                        hintText: 'Ingredient Name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: ingredientCategory,
                    decoration: InputDecoration(
                      hintText: 'Ingredient Category',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () async {
                          await addIngredients(
                              ingredientName.text, ingredientCategory.text);
                          setState(() {
                            v = false;
                            s = true;
                          });
                        },
                        child: const Text('Save'),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('clear'),
                      )
                    ],
                  )
                ],
              ),
            )),
        Visibility(
          visible: s,
          child: Container(
              decoration: const BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey))),
              child: TextFormField()),
        ),
        FutureBuilder(
          future: getingredients(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Expanded(
                child: SingleChildScrollView(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                           
                        },
                        title: Text(snapshot.data![index].name),
                      );
                    },
                  ),
                ),
              );
            }

            return const Center(
              child: Text('No Ingredient'),
            );
          },
        )
      ],
    );
  }
}
