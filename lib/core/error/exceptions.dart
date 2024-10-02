import 'package:movies/core/network/error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;
  ServerException({ required this.errorMessageModel});

}

class LocalDataBaseException implements Exception {
  final ErrorMessageModel message;
  LocalDataBaseException({ required this.message});

}