


import 'package:advance_flutter_project/core/networking/api_service.dart';
import 'package:advance_flutter_project/core/networking/dio_factory.dart';
import 'package:advance_flutter_project/features/login/logic/cubit/login_cubit.dart';
import 'package:advance_flutter_project/features/login/repos/login_repos.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setUpGetIt () async {

  Dio dio = await DioFactory.getDio();

  getIt.registerLazySingleton <ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton <LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory <LoginCubit>(() => LoginCubit(getIt()));
}