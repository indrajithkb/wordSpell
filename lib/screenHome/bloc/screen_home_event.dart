part of 'screen_home_bloc.dart';

class ScreenHomeEvent extends Equatable {
  const ScreenHomeEvent();

  @override
  List<Object> get props => [];
}

class UserWinEvent extends ScreenHomeEvent {
  bool userWins;
  UserWinEvent({required this.userWins});
}

class ChosenWordEvent extends ScreenHomeEvent {
  String chosenWord;
  ChosenWordEvent({required this.chosenWord});
}

class AddPointEvent extends ScreenHomeEvent {
  int point;
  AddPointEvent({required this.point});
}

class ResetPointsEvent extends ScreenHomeEvent{

}