import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:texttospeech/screenHome/bloc/screen_home_bloc.dart';
import 'package:texttospeech/screenHome/functions.dart';

class ScreenHome extends StatefulWidget {
  ScreenHome({super.key});

  @override
  _ScreenHomeState createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final TextEditingController wordController = TextEditingController();
  final FlutterTts flutterTts = FlutterTts();
  List<String> easyWordList = [
    'Just',
    'Keep',
    'Love',
    'Make',
    'Note',
    'Open',
    'Part',
    'Quiz',
    'Rain',
    'Stay',
  ];

  List<String> mediumWordList = [
    "Ocean",
    "Proud",
    "Quiet",
    "Snail",
    "Taste",
    "Urban",
    "Vowel",
    "Whisk",
    "Xerox",
    "Yield",
    "Zebra",
  ];

  List<String> hardWordList = [
    " Miscellaneous",
    "Mysterious",
    "Accompany",
    "Exquisite",
    "Millennium",
    "Embarrass",
    "Exaggerate",
    "Unnecessary",
    "Maintenance",
    "Supersede",
  ];

  List<String> wordList = [];

  void addWordByLength(
      List<String> sourceList, int desiredLength, List<String> targetList) {
    for (var word in sourceList) {
      if (word.length == desiredLength) {
        print(word);
        targetList.add(word);
      }
      if (word.length >= desiredLength) {
         print(word);
        targetList.add(word);
      }
    }
  }

  String chosenWord = "";
  // bool userWins = false;
  bool showResult = false;
  int pointsToAdd = 0;
  bool isEnableTextfield = true;
  Future<void> speakText(String text) async {
    await flutterTts.setVolume(1.0);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(2.0);
    await flutterTts.speak(text);
  }

  void chooseRandomWord() {
    if (wordList.isEmpty) {
      wordList = [
        // "Abandon",
        // "Abate",
        // "Abide",
        // "Abject",
        // "Absolve",
        // "Abstract",
        // "Abyss",
        // "Accord",
        // "Acquire",
        // "Admire",
      ];
    }
    final random = Random();
    final randomIndex = random.nextInt(wordList.length);
    chosenWord = wordList.removeAt(randomIndex);
    print(chosenWord);
    speakText(chosenWord);
  }

  void checkWin() {
    isEnableTextfield = false;

    if (wordController.text == chosenWord) {
      context.read<ScreenHomeBloc>().add(UserWinEvent(userWins: true));
      showResult = true;
      if (easyWordList.contains(chosenWord)) {
        pointsToAdd = 1;
      } else if (mediumWordList.contains(chosenWord)) {
        pointsToAdd = 3;
      } else if (hardWordList.contains(chosenWord)) {
        pointsToAdd = 5;
      }
      context.read<ScreenHomeBloc>().add(AddPointEvent(point: pointsToAdd));
    } else {
      context.read<ScreenHomeBloc>().add(UserWinEvent(userWins: false));

      setState(() {
        showResult = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ScreenHomeBloc, ScreenHomeState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        wordList.clear();
                        context.read<ScreenHomeBloc>().add(ResetPointsEvent());
                        // wordList.addAll(easyWordList);
                        addWordByLength(easyWordList, 4, wordList);
                      },
                      child: const Text('Easy')),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                        onPressed: () {
                          wordList.clear();
                          context
                              .read<ScreenHomeBloc>()
                              .add(ResetPointsEvent());
                          // wordList.addAll(mediumWordList);
                          addWordByLength(mediumWordList, 5, wordList);
                        },
                        child: const Text('Medium')),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        wordList.clear();
                        context.read<ScreenHomeBloc>().add(ResetPointsEvent());
                        // wordList.addAll(hardWordList);
                        addWordByLength(hardWordList, 6, wordList);

                        // mediumWordList.clear();
                      },
                      child: const Text('Hard')),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<ScreenHomeBloc>()
                            .add(UserWinEvent(userWins: false));
                        wordController.text = '';
                        showResult = false;
                        setState(() {});
                        isEnableTextfield = true;
                        chooseRandomWord();
                      },
                      child: const Text('Speak Random Word'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        enabled: isEnableTextfield,
                        controller: wordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // print("asdasdasdasdasd");
                        isEnableTextfield ? checkWin() : null;
                      },
                      child: const Text('Enter'),
                    ),
                    showResult == true
                        ? state.userWins == true
                            ? const Text(
                                "Correct answer!",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              )
                            : const Text(
                                "Wrong answer",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              )
                        : const SizedBox(),
                    Text('Points - ${state.points}')
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
