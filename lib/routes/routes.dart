import 'package:catering_management/features/estimate/estimate.dart';
import 'package:catering_management/features/orders/orders.dart';
import 'package:catering_management/features/recipe/recipe_screen.dart';
import 'package:catering_management/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

final GoRouter router = GoRouter(
    initialLocation: '/recipie',
    navigatorKey: _rootNavigatorKey,
    routes: [
      ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) {
            return MyHomePage(
              widgetBody: child,
            );
          },
          routes: [
            GoRoute(
              parentNavigatorKey: _shellNavigatorKey,
              path: '/recipie',
              pageBuilder: (context, state) {
                return NoTransitionPage(child: RecipeScreen());
              },
            ),
            GoRoute(
              path: '/orders',
              pageBuilder: (context, state) {
                return NoTransitionPage(child: OrdersScreen());
              },
            ),
            GoRoute(
              path: '/estimate',
              pageBuilder: (context, state) {
                return NoTransitionPage(child: EstimateScreen());
              },
              
            ),
          ])
    ]);
