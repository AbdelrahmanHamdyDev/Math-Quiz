class Datatemplete {
  const Datatemplete({required this.Question, required this.answers});

  final String Question;
  final List<String> answers;

  List<String> get ShuffleAnswers {
    List<String> NewList = List.of(answers);
    NewList.shuffle();
    return NewList;
  }
}
