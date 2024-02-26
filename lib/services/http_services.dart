// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:flicked_app/models/app_config.dart';

class HttpServices {
  final Dio dio = Dio();
  final GetIt getit = GetIt.instance;
  String ?_base_url;
  String? _api_key;
  HttpServices() {
    AppConfig _config = getit.get<AppConfig>();
    _base_url = _config.BASE_API_URL;
    _api_key = _config.API_KEY;
  }
  Future get(String _path,  Map<String, dynamic> query) async {
    try {
      String _url = '$_base_url $_path';
      Map<String, dynamic> _query = {'api_key': _api_key, 'language': 'en-US'};
      // if(query != null){
      _query.addAll(query);
      //  }
      return await dio.get(_url, queryParameters: _query);
    } on DioException catch (e) {
      print('Unable to perform get request');
      print('DioError $e');
    }
  }
}
