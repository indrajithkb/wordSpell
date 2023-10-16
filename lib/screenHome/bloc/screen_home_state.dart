// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'screen_home_bloc.dart';

class ScreenHomeState extends Equatable {
  const ScreenHomeState(
      {this.userWins = false, this.chosenWord = '', this.points = 0});
  final bool userWins;
  final String chosenWord;
  final int points;

  @override
  List<Object> get props => [userWins, chosenWord, points];

  ScreenHomeState copyWith({bool? userWins, String? chosenWord, int? points}) {
    return ScreenHomeState(
        userWins: userWins ?? this.userWins,
        chosenWord: chosenWord ?? this.chosenWord,
        points: points ?? this.points);
  }
}

// final class ScreenHomeInitial extends ScreenHomeState {}
