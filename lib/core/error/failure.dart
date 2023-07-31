import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  // ignore: deprecated_member_use
  factory ServerFailure.fromDioError(DioError e)
  {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with api server');

      case DioExceptionType.sendTimeout:
        return ServerFailure('send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with api server');

      case DioExceptionType.badCertificate:
        return ServerFailure('badCertificate timeout with api server');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            e.response!.statusCode!, e.response!.data);

      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceld');

      case DioExceptionType.connectionError:
        return ServerFailure('No internet connection');

      case DioExceptionType.unknown:
        return ServerFailure('Opps there was an error, please ty again');
    }
  }


  factory ServerFailure.fromResponse (int? statusCode, dynamic response)
  {
    if (statusCode == 404) {
      return ServerFailure('Your request was not found');
    } else if (statusCode == 500) {
      return ServerFailure('there is a problem with server');
    }else if (statusCode == 400 || statusCode == 401 || statusCode == 403)
    {
      return ServerFailure(response['error']['message']);
    }else
    {
      return ServerFailure('there was an error , please try again');
    }
  }

}
