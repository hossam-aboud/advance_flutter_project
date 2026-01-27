import 'package:advance_flutter_project/core/di/dependency_injection.dart';
import 'package:advance_flutter_project/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'doc_app.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  setUpGetIt();
  await ScreenUtil.ensureScreenSize();
  runApp( DocApp(
    appRouter: AppRouter(),
  ),);
}



// CI / CD
// CI -> continues integration
// CD -> continues deployemnt