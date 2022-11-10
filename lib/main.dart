import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

void generateComputerHand() {
  Random().nextInt(3);
}

const goo = "✊";
const choki = "✌️";
const paa = "✋";

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const jankenPage(),
    );
  }
}

class jankenPage extends StatefulWidget {
  const jankenPage({Key? key}) : super(key: key);

  @override
  State<jankenPage> createState() => _jankenPageState();
}

class _jankenPageState extends State<jankenPage> {
  String myHand = 'goo';
  String computerHand = 'goo';
  String result = '引き分け';

  void selectHand(String selectedHand) {
    myHand = selectedHand; // myHand に 引数として受けとった selectedHand を代入します。
    print(myHand);
    generateComputerHand();
    judge();
    setState(() {});
  }

  void generateComputerHand() {
    // randomNumberに一時的に値を格納します。
    final randomNumber = Random().nextInt(3);
    // 生成されたランダムな数字を ✊, ✌️, 🖐 に変換して、コンピューターの手に代入します。
    computerHand = randomNumberToHand(randomNumber);
  }

  String randomNumberToHand(int randomNumber) {
    // () のなかには条件となる値を書きます。
    switch (randomNumber) {
      case 0: // 入ってきた値がもし 0 だったら。
        return 'goo'; // ✊を返す。
      case 1: // 入ってきた値がもし 1 だったら。
        return 'choki'; // ✌️を返す。
      case 2: // 入ってきた値がもし 2 だったら。
        return 'paa'; // 🖐を返す。
      default: // 上で書いてきた以外の値が入ってきたら。
        return 'goo'; // ✊を返す。（0, 1, 2 以外が入ることはないが念のため）
    }
  }

  void judge() {
    // 引き分けの場合
    if (myHand == computerHand) {
      result = '引き分け';
      // 勝ちの場合
    } else if (myHand == 'goo' && computerHand == 'choki' ||
        myHand == 'choki' && computerHand == 'paa' ||
        myHand == 'paa' && computerHand == 'goo') {
      result = '勝ち';
      // 負けの場合
    } else {
      result = '負け';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('じゃんけん'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              result,
              style: TextStyle(
                fontSize: 32,
              ),
            ),
            Text(
              computerHand,
              style: TextStyle(
                fontSize: 32,
              ),
            ),
            SizedBox(height: 48),
            Text(
              myHand,
              style: TextStyle(fontSize: 32),
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    selectHand('goo');
                  },
                  child: Text('goo'),
                ),
                ElevatedButton(
                  onPressed: () {
                    selectHand('choki');
                  },
                  child: Text('choki'),
                ),
                ElevatedButton(
                  onPressed: () {
                    selectHand('paa');
                  },
                  child: Text('paa'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
