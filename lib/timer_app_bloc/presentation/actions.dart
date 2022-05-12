import 'package:bloc_state_management_examples/timer_app_bloc/logic/blocs/bloc/timer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Actionsa extends StatelessWidget {
  const Actionsa({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      buildWhen: (prev, state) => prev.runtimeType != state.runtimeType,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if( state is TimerInitial) ...[
              FloatingActionButton(
                child: const Icon(Icons.play_arrow),
                onPressed: () => context.read<TimerBloc>().add(TimerStarted(duration: state.duration)),
              ),
            ],
            if( state is TimerRunInProgress) ...[
              FloatingActionButton(
                child: const Icon(Icons.pause),
                onPressed: () => context.read<TimerBloc>().add(TimerPaused()),
              ),
              FloatingActionButton(
                child: const Icon(Icons.replay),
                onPressed: () => context.read<TimerBloc>().add(TimerReset()),
              ),
            ],
            if( state is TimerRunPause) ...[
              FloatingActionButton(
                child: const Icon(Icons.play_arrow),
                onPressed: () => context.read<TimerBloc>().add(TimerResumed()),
              ),
              FloatingActionButton(
                child: const Icon(Icons.replay),
                onPressed: () => context.read<TimerBloc>().add(TimerReset()),
              ),
            ],
            if( state is TimerRunComplete) ...[
              FloatingActionButton(
                child: const Icon(Icons.replay),
                onPressed: () => context.read<TimerBloc>().add(TimerReset()),
              ),
            ]
          ],
        );
      },
    );
  }
}