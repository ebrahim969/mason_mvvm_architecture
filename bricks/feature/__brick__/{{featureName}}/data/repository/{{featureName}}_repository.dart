import '../../domain/repository/{{featureName}}_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../model/{{featureName}}_model.dart';
import '../../../../../core/network/dio_consumer.dart';




abstract interface class {{featureName.pascalCase()}}Repository {

  Future<Either<Failure, {{featureName.pascalCase()}}Model>> post{{featureName.pascalCase()}}({
    required String userId,
  });
}


class {{featureName.pascalCase()}}RepositoryImpl implements {{featureName.pascalCase()}}Repository {
  final DioConsumer dio;
  const {{featureName.pascalCase()}}RepositoryImpl (this.dio);

  @override
  Future<Either<Failure, {{featureName.pascalCase()}}Model>> post{{featureName.pascalCase()}}({required String userId}) {
    // TODO: implement postAuth
    throw UnimplementedError();
  }
}

