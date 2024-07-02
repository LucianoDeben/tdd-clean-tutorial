import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:myapp/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';

import '../../../../mocks.mocks.dart';

void main() {
  late GetConcreteNumberTrivia usecase;
  late MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });

  const int tNumber = 1;
  const NumberTrivia tNumberTrivia = NumberTrivia(text: 'test', number: tNumber);

  test('should get concrete number trivia from the repository', () async {
    // Arrange
    when(mockNumberTriviaRepository.getConcreteNumberTrivia(any))
      .thenAnswer((_) async => const Right(tNumberTrivia));

    // Act
    final result = await usecase.execute(number: tNumber);

    // Assert
    expect(result, const Right(tNumberTrivia));
    verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}

