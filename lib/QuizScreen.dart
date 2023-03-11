import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:play_guess_color/ResultScreen.dart';
import 'package:animated_background/animated_background.dart';
import 'package:parallax_rain/parallax_rain.dart';

class QuizScreen extends StatefulWidget {
  QuizScreen();

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}
class _QuizScreenState extends State<QuizScreen> {

  List<String> colors = [
    "أحمر",
    "أخضر",
    "أصفر",
    "برتقالي",
    "بني",
    "أسود",
    "أبيض",
    "ذهبي",
    "رمادي",
    "وردي",
    "بنفسجي",
    "سماوي",
    "تفاحي",
    "أزرق",
  ];
  List<String> color = [
    "أحمر",
    "أخضر",
    "أصفر",
    "برتقالي",
    "بني",
    // "أسود",
    // "أبيض",
    "ذهبي",
    "رمادي",
    "وردي",
    "بنفسجي",
    // "سماوي",
    // "تفاحي",
    "أزرق",
    // "red",
    // "green",
    // "yellow",
    // "orange",
    // "brown",
    // "black",
    // "white",
    // "amber",
    // "grey",
    // "pink",
    // "purple",
    // "lightBlueAccent",
    // "greenAccent",
    // "blue",
  ];
  int all=0;
  int yes=0;
  int no=0;
  int num=Random().nextInt(2);
  int numm=Random().nextInt(2);
  @override
  void initState() {//داله تمثل اول حاله بياخذه الاستست فل ودجت
    colors.shuffle();//عشان يغير ترتيب مصفوفه المدن ويصير كل مره مدن عشوائيه تطلع
    color.shuffle();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    if(colors[numm]==color[num])
      numm++;
    List<String> colo=[color[num],colors[numm]];
    colo.shuffle();
    MaterialColor col=Colors.red;
    if(color[num]=="أخضر")
       col=Colors.green;
    else if (color[num]=="أزرق")
       col=Colors.blue;
    else if (color[num]=="أصفر")
      col=Colors.yellow;
    else if (color[num]=="برتقالي")
      col=Colors.orange;
    else if (color[num]=="بني")
      col=Colors.brown;
    // else if (color[num]=="أسود")
    //   col=Colors.black as MaterialColor;
    // else if (color[num]=="أبيض")
    //   col=Colors.white as MaterialColor;
    else if (color[num]=="ذهبي")
      col=Colors.amber;
    else if (color[num]=="رمادي")
      col=Colors.grey;
    else if (color[num]=="وردي")
      col=Colors.pink;
    else if (color[num]=="بنفسجي")
      col=Colors.purple;
    // else if (color[num]=="سماوي")
    //   col=Colors.lightBlueAccent as MaterialColor;
    // else if (color[num]=="تفاحي")
    //   col=Colors.greenAccent as MaterialColor;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
    // In body we have a AnimatedBackgound,
    // behavior RandomParticleBehaviour.
    body: Container(
        decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 255, 255, 255),
            Color.fromARGB(255, 210, 222, 221)
          ],
        )),
    child: Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    child: ParallaxRain(
    dropColors: [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.brown,
    Colors.blueGrey
    ],
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 16),
              const Text(
                "اختاري اللون وليس الكلمة",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                ),
              ),
              Text(
                colors[numm],
                style:  TextStyle(
                  fontSize: 34,
                  color: col,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 30),
              for(int i=0;i<2;i++)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: FlagButton(
                    name: colo[i],
                    onPressed: () {
                      all++;
                      if(color[num]==colo[i]) {
                        Fluttertoast.showToast(msg: "إجابة صحيحه , أحسنت",backgroundColor: Colors.green,);
                        yes++;
                      }else{
                        Fluttertoast.showToast(msg: "إجابة خاطئه , حاول مره أخرى",backgroundColor: Colors.redAccent,);
                        no++;
                      }
                      setState(() {
                        colors.shuffle();
                        color.shuffle();
                        num=Random().nextInt(2);
                        numm=Random().nextInt(2);
                      });

                    },),
                ),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultScreen(Yes:yes,No:no,All:all),),);
              }, child: const Text("النتيجة"))
            ],
          ),
        ),
      ),
    ),
    ),
    ),
    );
  }
}

class FlagButton extends StatelessWidget {
  const FlagButton({
    Key? key,
    required this.name,
    required this.onPressed,
  }) : super(key: key);

  final String name;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
        child: Image.asset(
      "assets/color/$name.png",
      height: 180,
    ));
  }
}
