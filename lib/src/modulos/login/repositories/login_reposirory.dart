import 'package:dio/dio.dart';
import 'package:my_money/src/http/app_dio.dart';
import 'package:my_money/src/modulos/login/model/login.model.dart';

class LoginRepository {
  String baseURL = "http://172.18.96.1:3099/auth/login";

  Future<Response<Map<String, dynamic>>> sendData(LoginModel loginData) async {
    Dio clientHTTP = await AppDio.getConnection(isAuth: false);

    return clientHTTP.post(baseURL, data: loginData.toJson());
  }
  }