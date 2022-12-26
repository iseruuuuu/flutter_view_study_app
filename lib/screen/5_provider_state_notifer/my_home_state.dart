class MyHomePageState {
  const MyHomePageState({this.counter = 0});

  final int counter;

  //copyWithを実行したら、MyHomePageStateをReturnする。
  MyHomePageState copyWith(int counter) => MyHomePageState(counter: counter);
}
