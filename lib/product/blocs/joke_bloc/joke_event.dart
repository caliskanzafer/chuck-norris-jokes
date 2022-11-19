part of 'joke_bloc.dart';

abstract class JokeEvent extends Equatable {
  const JokeEvent();
  @override
  List<Object> get props => [];
}

class NewJokeEvent extends JokeEvent {}

class GetJokeCategoryEvent extends JokeEvent {}
