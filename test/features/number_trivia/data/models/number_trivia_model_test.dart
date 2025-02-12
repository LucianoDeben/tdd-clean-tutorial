import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:myapp/features/number_trivia/domain/entities/number_trivia.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tNumberTriviaModel = NumberTriviaModel(number: 1, text: 'Test Text');

  test('should be a subclass of NumberTrivia entity', () async {
    // Assert
    expect(tNumberTriviaModel, isA<NumberTrivia>());
  });

  group('fromJson', () {
    test('should return a valid model when the JSON number is an integer',
        () async {
      // Arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('trivia.json'));
      // Act
      final result = NumberTriviaModel.fromJson(jsonMap);
      // Assert
      expect(result, tNumberTriviaModel);
    });

    test(
        'should return a valid model when the JSON number is regarded as an integer',
        () async {
      // Arrange
      final Map<String, dynamic> jsonMap = {
        'text': 'Test Text',
        'number': 1.0,
      };
      // Act
      final result = NumberTriviaModel.fromJson(jsonMap);
      // Assert
      expect(result, tNumberTriviaModel);
    });

    test(
        'should return a valid model when the JSON number is regarded as a double',
        () async {
      // Arrange
      final Map<String, dynamic> jsonMap = {
        'text': 'Test Text',
        'number': 1.0,
      };
      // Act
      final result = NumberTriviaModel.fromJson(jsonMap);
      // Assert
      expect(result, tNumberTriviaModel);
    });
  });

  group('ToJson', () {
    test('should return a JSON map containing the proper data', () async {
      // Act
      final result = tNumberTriviaModel.toJson();
      // Assert
      final expectedJsonMap = {
        'text': 'Test Text',
        'number': 1,
      };
      expect(result, expectedJsonMap);
    });
  });
}
