import 'package:catering_management/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(   ProviderScope(child:  MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        textTheme: TextTheme(),
        primarySwatch: Colors.purple,
      ),
      routerConfig: router,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({required this.widgetBody, super.key});

  Widget widgetBody;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<NavigationRailDestination> navRail = <NavigationRailDestination>[
    MyCustomNavigationRailItem(
      initialLocation: '/recipie',
      icon: const Icon(Icons.grid_view_outlined),
      selectedIcon: const Icon(Icons.grid_view_rounded),
      label: const Text('Recipie'),
    ),
    MyCustomNavigationRailItem(
      initialLocation: '/orders',
      icon: const Icon(Icons.sell_outlined),
      selectedIcon: const Icon(Icons.sell),
      label: const Text('orders'),
    ),
    MyCustomNavigationRailItem(
      initialLocation: '/estimate',
      icon: const Icon(Icons.inventory_2_outlined),
      selectedIcon: const Icon(Icons.inventory),
      label: const Text('Estimation'),
    ),
  ];

  _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/recipie');
        break;
      case 1:
        GoRouter.of(context).go('/orders');
        break;
      case 2:
        GoRouter.of(context).go('/estimate');
        break;

      default:
    }
  }

  _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    if (location.contains('/recipie')) {
      return 0;
    }
    if (location.startsWith('/orders')) {
      return 1;
    }
    if (location.startsWith('/estimate')) {
      return 2;
    }

    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
        primaryNavigation: SlotLayout(
          config: {
            Breakpoints.large: SlotLayout.from(
              key: const Key('recipie page'),
              builder: (context) {
                return Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      right: BorderSide(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 2),
                    ),
                    boxShadow: [
                      BoxShadow(
                          blurStyle: BlurStyle.outer,
                          color: Colors.black,
                          offset: Offset(-10, 5),
                          blurRadius: 10,
                          spreadRadius: 20)
                    ],
                  ),
                  width: 100,
                  child: NavigationRail(
                      onDestinationSelected: (value) =>
                          _onItemTapped(value, context),
                      labelType: NavigationRailLabelType.all,
                      groupAlignment: -0.9,
                      destinations: navRail,
                      indicatorColor: Color.fromARGB(78, 155, 39, 176),
                      useIndicator: true,
                      selectedIndex: _calculateSelectedIndex(context)),
                );
              },
            ),
          },
        ),
        body: SlotLayout(config: {
          Breakpoints.standard: SlotLayout.from(
            key: Key('body'),
            builder: (context) => widget.widgetBody,
          )
        }));
  }
}

class MyCustomNavigationRailItem extends NavigationRailDestination {
  final String initialLocation;
  MyCustomNavigationRailItem(
      {super.padding = const EdgeInsets.all(0),
      required this.initialLocation,
      required super.icon,
      required super.label,
      required super.selectedIcon});
}
