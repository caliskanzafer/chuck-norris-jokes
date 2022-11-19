part of 'joke_bloc.dart';

abstract class JokeState extends Equatable {
  final Joke? joke;
  const JokeState({this.joke});
  @override
  List<Object?> get props => [joke];
}

class JokeLoadingState extends JokeState {}

class JokeLoadedState extends JokeState {
  const JokeLoadedState({Joke? joke}) : super(joke: joke);
}

class JokeErrorState extends JokeState {}
