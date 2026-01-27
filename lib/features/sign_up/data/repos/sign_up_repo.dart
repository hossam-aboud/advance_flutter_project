

 import 'package:advance_flutter_project/core/networking/api_error_handler.dart';
import 'package:advance_flutter_project/core/networking/api_result.dart';
import 'package:advance_flutter_project/core/networking/api_service.dart';
import 'package:advance_flutter_project/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:advance_flutter_project/features/sign_up/data/models/sign_up_response.dart';

class SignUpRepo {
  final ApiService _apiService;

  SignUpRepo (this._apiService);

  Future<ApiResult<SignUpResponse>> signup (SignUpRequestBody signupRequestBody) async  {

    try {
          final response = await _apiService.signup(signupRequestBody);

           return ApiResult.success(response);
        } catch (error ) {
      return ApiResult.failure(ErrorHandler.handle(error));

        }
  }
 }