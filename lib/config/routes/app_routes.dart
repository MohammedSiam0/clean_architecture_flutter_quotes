import 'package:clean_architecture_flutter/features/favorite_quote/presentation/screens/favorite_screen.dart';
import 'package:clean_architecture_flutter/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:clean_architecture_flutter/features/random_quote/presentation/screens/quote_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/app_strings.dart';
import 'package:clean_architecture_flutter/injection_container.dart' as di;

class Routes {
  static const String initialRoute = '/';
  static const String favoriteRoute = '/favorite';
}

// الطريقة الاولة
// final routes = {
//   Routes.initialRoute: (context) => QuoteScreen(),
//   Routes.favoriteRoute: (context) => FavoriteQuoteScreen(),
// };

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => di.sl<RandomQuoteCubit>(),
                  child: const QuoteScreen(),
                ));

      case Routes.favoriteRoute:
        return MaterialPageRoute(
            builder: (context) => const FavoriteQuoteScreen());

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: ((context) => const Scaffold(
              body: Center(
                child: Text(AppStrings.noRouteFound),
              ),
            )));
  }
}
