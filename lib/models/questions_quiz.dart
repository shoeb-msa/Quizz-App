class QuestionsQuiz {
  const QuestionsQuiz(this.text,this.answers);
  final String text;
  final List<String> answers;
  List<String> getshuffledand()
  {
    final shuffledlist = List.of(answers);
    shuffledlist.shuffle();
    return shuffledlist;
  }
} 
  
