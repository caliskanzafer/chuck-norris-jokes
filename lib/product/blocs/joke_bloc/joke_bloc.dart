import 'package:chuck_norris_app/product/service/joke_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/joke.dart';

part 'joke_event.dart';
part 'joke_state.dart';

class JokeBloc extends Bloc<JokeEvent, JokeState> {
  final JokeService _jokeService;
  JokeBloc({required JokeService jokeService})
      : _jokeService = jokeService,
        super(JokeLoadingState()) {
    on<NewJokeEvent>(newJoke);
  }

  newJoke(NewJokeEvent event, Emitter<JokeState> emit) async {
    emit(JokeLoadingState());
    Joke newJoke = await _jokeService.getJoke();

    if (newJoke.id != null) {
      emit(JokeLoadedState(joke: newJoke));
    } else {
      emit(JokeErrorState());
    }
  }
}
