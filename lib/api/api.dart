import 'package:dio/dio.dart';
import 'package:get/route_manager.dart';
import 'package:simple/model/data.dart';

class BaseApi {
  static Dio dio = _setupDio();
  static Dio _setupDio() {
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      error: true,
      request: true,
      requestBody: true,
    ));

    return dio;
  }

  static String baseApi = 'https://reqres.in/api';
  static String endpoint = '/users';

  static Future<Response<dynamic>?> handleApi(
      Future<Response<dynamic>> dio) async {
    try {
      var response = await dio;

      return response;
    } on DioError {
      Get.snackbar('Get Data', 'Something went wrong');
      return null;
    } catch (e) {
      Get.snackbar('Get Data', e.toString());
      return null;
    }
  }

  static Future<Response<dynamic>?> postStaf(DataStaff dataStaff) async {
    var response = await handleApi(
      dio.post(
        '$baseApi$endpoint',
        data: dataStaff.toJson,
      ),
    );
    return response;
  }
}
