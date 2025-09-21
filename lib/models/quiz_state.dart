import 'package:flutter/foundation.dart';

class QuizState with ChangeNotifier {
  int _currentQuestionIndex = 0;
  int _score = 0;

  int get currentQuestionIndex => _currentQuestionIndex;
  int get score => _score;

  void answerQuestion(int selectedAnswerIndex, int correctAnswerIndex) {
    if (selectedAnswerIndex == correctAnswerIndex) {
      _score++;
    }
    if (_currentQuestionIndex < 2) {
      _currentQuestionIndex++;
      notifyListeners();
    } else {
      notifyListeners();
    }
  }

  void resetQuiz() {
    _currentQuestionIndex = 0;
    _score = 0;
    notifyListeners();
  }
}