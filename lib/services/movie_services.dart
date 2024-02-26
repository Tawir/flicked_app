import 'package:flicked_app/services/http_services.dart';
import 'package:get_it/get_it.dart';

class MovieServices{
  final getIt = GetIt.instance;
   HttpServices ? _http;
  MovieServices(){
_http = getIt.registerSingleton(
  HttpServices(),
);
  }
}