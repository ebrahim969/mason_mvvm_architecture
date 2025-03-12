import 'package:core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

Future<Either<Failure, T>> handleDioRequest<T>({
  required Future<T> Function() request,
}) async {
  try {
    final response = await request();
    return Right(response);
  } on DioException catch (e) {
    return Left(ServerFailure.fromDioError(e));
  } catch (e) {
    return Left(ServerFailure(e.toString()));
  }
}
