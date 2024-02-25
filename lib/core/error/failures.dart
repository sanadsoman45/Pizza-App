import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
  final List<dynamic> properties;

  Failure(this.properties);

  @override
  List<Object?> get props => properties;
}

class ServerException extends Failure {
  ServerException(super.properties);
}


class CacheException extends Failure {
  CacheException(super.properties);
}