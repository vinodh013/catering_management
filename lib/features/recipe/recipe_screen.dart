import 'package:catering_management/features/recipe/add_recipe.dart';
import 'package:catering_management/widgets/searchbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:multi_split_view/multi_split_view.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
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

class RecipesList extends StatefulWidget {
  const RecipesList({super.key});

  @override
  State<RecipesList> createState() => _RecipesListState();
}

class _RecipesListState extends State<RecipesList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

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
                "Recipe's",
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
                  Scaffold.of(context).openDrawer();
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

class IngredientList extends StatefulWidget {
  const IngredientList({super.key});

  @override
  State<IngredientList> createState() => _IngredientListState();
}

class _IngredientListState extends State<IngredientList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          children: const [
            Text("Ingredient's",
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(85, 155, 39, 176))),
          ],
        ),
      ],
    );
  }
}
