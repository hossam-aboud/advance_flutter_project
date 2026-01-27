import 'package:advance_flutter_project/core/di/dependency_injection.dart';
import 'package:advance_flutter_project/core/routing/routes.dart';
import 'package:advance_flutter_project/features/home/ui/home_screen.dart';
import 'package:advance_flutter_project/features/login/logic/cubit/login_cubit.dart';
import 'package:advance_flutter_project/features/login/ui/login_screen.dart';
import 'package:advance_flutter_project/features/onboarding/ui/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => BlocProvider(
          create: (context) => getIt<LoginCubit>() ,
          child: const LoginScreen(),
        ),);
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(title: const Text('Error')),
            body: const Center(child: Text('Something went wrong')),
          ),
        );
    }
  }
}
