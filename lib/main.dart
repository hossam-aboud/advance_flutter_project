import 'package:advance_flutter_project/core/di/dependency_injection.dart';
import 'package:advance_flutter_project/core/routing/app_router.dart';
import 'package:flutter/material.dart';

import 'doc_app.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  setUpGetIt();
  runApp( DocApp(
    appRouter: AppRouter(),
  ),);
}
