import 'package:dio/dio.dart';

abstract class Failures {
  final String errMessage;

  const Failures(this.errMessage);
}

class ServerFailure extends Failures {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioException) {
    {
      switch (dioException.type) {
        case DioExceptionType.connectionTimeout:
          return ServerFailure("Connection timeout with ApiServer");
        case DioExceptionType.receiveTimeout:
          return ServerFailure("Receive timeout with ApiServer");
        case DioExceptionType.sendTimeout:
          return ServerFailure("Send timeout with ApiServer");
        case DioExceptionType.badCertificate:
          return ServerFailure("Bad Certificate with ApiServer");
        case DioExceptionType.badResponse:
          return ServerFailure.fromResponse(
              dioException.response!.statusCode!, dioException.response!.data);
        case DioExceptionType.cancel:
          return ServerFailure("Request to ApiServer was cancelled");
        case DioExceptionType.connectionError:
          return ServerFailure("Connection error with ApiServer");
        case DioExceptionType.unknown:
          if (dioException.message!.contains("SocketException")) {
            return ServerFailure("No internet connection");
          } else {
            return ServerFailure("Unexpected error, please try again");
          }
        default:
          return ServerFailure("An error has occurred, Please try again");
      }
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure("Your request not found. Please try later!");
    } else if (statusCode == 500) {
      return ServerFailure("Internal server error, please try later!");
    } else {
      return ServerFailure("An error has occurred, Please try again");
    }
  }
}
