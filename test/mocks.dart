import 'package:mockito/annotations.dart';
import 'package:myapp/core/network/network_info.dart';
import 'package:myapp/features/number_trivia/data/datasources/number_trivia_local_datasource.dart';
import 'package:myapp/features/number_trivia/data/datasources/number_trivia_remote_datasource.dart';
import 'package:myapp/features/number_trivia/domain/repositories/number_trivia_repository.dart';

@GenerateMocks([
  NumberTriviaRepository,
  NumberTriviaRemoteDatasource,
  NumberTriviaLocalDatasource,
  NetworkInfo,
])
void main() {}
