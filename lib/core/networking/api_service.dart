

import 'package:advance_flutter_project/core/networking/api_constants.dart';
import 'package:advance_flutter_project/features/login/data/models/login_request_body.dart';
import 'package:advance_flutter_project/features/login/data/models/login_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'api_service.g.dart';
@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {


  factory ApiService (Dio dio , {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody , );
}