import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/models/quiz_state.dart';
import 'package:quiz_app/models/question.dart';

class QuizScreen extends StatelessWidget {
  final List<Question> questions = [
    Question(text: 'What is Flutter?', options: ['A UI toolkit', 'A programming language', 'An operating system', 'A database'], correctAnswerIndex: 0),
    Question(text: 'Which company developed Flutter?', options: ['Google', 'Microsoft', 'Apple', 'Facebook'], correctAnswerIndex: 0),
    Question(text: 'What language is Flutter based on?', options: ['Dart', 'Java', 'Python', 'C++'], correctAnswerIndex: 0),
  ];

  @override
  Widget build(BuildContext context) {
    final quizState = Provider.of<QuizState>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Quiz')), 
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0), 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: <Widget>[
              Text(
                'Question ${quizState.currentQuestionIndex + 1}/${questions.length}',
                style: const TextStyle(fontSize: 20), 
              ),
              const SizedBox(height: 20), 
              Text(
                questions[quizState.currentQuestionIndex].text,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30), 
              ...(questions[quizState.currentQuestionIndex].options.asMap().entries.map((entry) {
                int index = entry.key;
                String option = entry.value;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      quizState.answerQuestion(index, questions[quizState.currentQuestionIndex].correctAnswerIndex);
                    },
                    style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(16)),
                    child: Text(option, style: const TextStyle(fontSize: 18)),
                  ),
                );
              })),
              const SizedBox(height: 30), 
              Text('Score: ${quizState.score}', style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 20),
              if (quizState.currentQuestionIndex == questions.length - 1)
                ElevatedButton(
                  onPressed: () {
                    quizState.resetQuiz();
                  },
                  child: const Text('Restart Quiz'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}