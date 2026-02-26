class QuizQuestions {

const QuizQuestions(this.text , this.answer);

final String text ;
final List<String> answer ;

List<String> getShuffled () {
   final shuffled = List.of(answer);
    shuffled.shuffle() ;
   return  shuffled; 
}
}