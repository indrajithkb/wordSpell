import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'screen_home_event.dart';
part 'screen_home_state.dart';

class ScreenHomeBloc extends Bloc<ScreenHomeEvent, ScreenHomeState> {
  ScreenHomeBloc() : super(ScreenHomeState()) {
    on<UserWinEvent>(_onUserWinEvent);
    on<ChosenWordEvent>(_onChosenWordEvent);
    on<AddPointEvent>(_onAddPointEvent);
    on<ResetPointsEvent>(_onResetPointsEvent);
  }

  FutureOr<void> _onUserWinEvent(
      UserWinEvent event, Emitter<ScreenHomeState> emit) async {
    emit(state.copyWith(userWins: event.userWins));
  }

  FutureOr<void> _onChosenWordEvent(
      ChosenWordEvent event, Emitter<ScreenHomeState> emit) async {
    emit(state.copyWith(chosenWord: event.chosenWord));
  }

  FutureOr<void> _onAddPointEvent(
      AddPointEvent event, Emitter<ScreenHomeState> emit) async {
    int points = state.points + event.point;
    emit(state.copyWith(points: points));
  }

  FutureOr<void> _onResetPointsEvent(
      ResetPointsEvent event, Emitter<ScreenHomeState> emit) async {
    emit(state.copyWith(points: 0));
  }
}
