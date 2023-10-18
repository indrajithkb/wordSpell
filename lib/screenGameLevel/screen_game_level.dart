import 'package:flutter/material.dart';

class ScreenGameLevel extends StatelessWidget {
  const ScreenGameLevel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  // wordList.clear();
                  // context.read<ScreenHomeBloc>().add(ResetPointsEvent());
                  // // wordList.addAll(easyWordList);
                  // addWordByLength(easyWordList, 4, wordList);
                },
                child: const Text('Easy')),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                  onPressed: () {
                    // wordList.clear();
                    // context.read<ScreenHomeBloc>().add(ResetPointsEvent());
                    // // wordList.addAll(mediumWordList);
                    // addWordByLength(mediumWordList, 5, wordList);
                  },
                  child: const Text('Medium')),
            ),
            ElevatedButton(
                onPressed: () {
                  // wordList.clear();
                  // context.read<ScreenHomeBloc>().add(ResetPointsEvent());
                  // // wordList.addAll(hardWordList);
                  // addWordByLength(hardWordList, 6, wordList);

                  // mediumWordList.clear();
                },
                child: const Text('Hard')),
          ],
        ),
      ),
    );
  }
}
