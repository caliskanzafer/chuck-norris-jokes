import 'package:chuck_norris_app/product/service/joke_service.dart';
import 'package:flutter/material.dart';

import '../product/blocs/bloc_imports.dart';

class JokeView extends StatelessWidget {
  JokeView({super.key});
  final JokeService _jokeService = JokeService();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JokeBloc(jokeService: _jokeService)..add(NewJokeEvent()),
      child: Scaffold(
        body: BlocBuilder<JokeBloc, JokeState>(
          builder: (context, state) {
            if (state is JokeLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is JokeLoadedState) {
              return Center(
                child: ListTile(
                  title: Text(state.joke!.value ?? ""),
                ),
              );
            }
            if (state is JokeErrorState) {
              return const Center(
                child: ListTile(
                  title: Text("error"),
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
