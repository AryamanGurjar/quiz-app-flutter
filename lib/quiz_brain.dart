
// @dart=2.9
import 'question.dart';


class Quiz_brain{
  int _question_number = 0;

  List<Question> _q =
  [
    Question(q: '1. You can lead a cow down stairs but not up stairs.',a: false ),
    Question( q: '2. Approximately one quarter of human bones are in the feet.',a:
    true),
    Question( q: '3. A slug\'s blood is green',a: true),
    Question(q: '4. Some cats are actually allergic to humans', a: true),
    Question(q: '5. You can lead a cow down stairs but not up stairs.', a: false),
    Question(q: '6. Approximately one quarter of human bones are in the feet.',a:true),
    Question(q: '7. A slug\'s blood is green.', a: true),
    Question(q: '8. Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', a: true),
    Question(q: '9. It is illegal to pee in the Ocean in Portugal.', a: true),
    Question(q:

    '10. No piece of square dry paper can be folded in half more than 7 times.',
        a:false),
    Question(
        q: '11. In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        a: true),
    Question(
        q: '12. The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        a: false),
    Question(
        q: '13. The total surface area of two human lungs is approximately 70 square metres.',
        a: true),
    Question(q: '14. Google was originally called \"Backrub\".',a:true),
    Question(
        q: '15. Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        a: true),
    Question(
        q: '16. In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        a: true),
  ];

  String get_question()
  {
    return _q[_question_number].question;

  }



  bool get_answer()
  {
    return _q[_question_number].answer;
  }
  int next_question(){
    if(_question_number < _q.length - 1){
      _question_number++;
    }

  }
}
