part of '{{featureName}}_cubit.dart';

class {{featureName.pascalCase()}}State extends Equatable {
    final CubitStatus status;


  const {{featureName.pascalCase()}}State({this.status = CubitStatus.initial});

  {{featureName.pascalCase()}}State copyWith({CubitStatus? status}){
    return {{featureName.pascalCase()}}State(status: status ?? this.status);
  }



  @override
  List<Object> get props => [status];
}