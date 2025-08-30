import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../model/{{featureName}}_model.dart';
import '../../../../core/network/api_consumer.dart';




abstract interface class {{featureName.pascalCase()}}Repository {

  Future<Either<Failure, {{featureName.pascalCase()}}Model>> post{{featureName.pascalCase()}}({
    required String userId,
  });
}


class {{featureName.pascalCase()}}RepositoryImpl implements {{featureName.pascalCase()}}Repository {
  final ApiConsumer apiConsumer;
  const {{featureName.pascalCase()}}RepositoryImpl (this.apiConsumer);

  @override
  Future<Either<Failure, {{featureName.pascalCase()}}Model>> post{{featureName.pascalCase()}}({required String userId}) {
    // TODO: implement postAuth
    throw UnimplementedError();
  }
}

