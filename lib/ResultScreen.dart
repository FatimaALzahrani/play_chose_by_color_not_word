import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen({required this.Yes,required this.No,required this.All});
  final int Yes;
  final int No;
  final int All;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}
class _ResultScreenState extends State<ResultScreen>
    with SingleTickerProviderStateMixin {
  ParticleOptions particles = const ParticleOptions(
    baseColor: Colors.cyan,
    spawnOpacity: 0.0,
    opacityChangeRate: 0.25,
    minOpacity: 0.1,
    maxOpacity: 0.4,
    particleCount: 70,
    spawnMaxRadius: 15.0,
    spawnMaxSpeed: 100.0,
    spawnMinSpeed: 30,
    spawnMinRadius: 7.0,
  );
  @override
  Widget build(BuildContext context) {
    double Av=(widget.Yes/widget.All)*100;
    return Scaffold(
      appBar: AppBar(
        title: Text("النتيجة"),
      ),
      body: AnimatedBackground(
      behaviour:RandomParticleBehaviour(options: particles),
      vsync: this,
      child:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "  ${widget.Yes} عدد الاجابات الصحيحة ",
              style: TextStyle(
                fontSize: 24,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 30),
            Text(
              "  ${widget.No} عدد الاجابات الخاطئة ",
              style: const TextStyle(
                fontSize: 24,
                color: Colors.red,
              ),
            ),
            SizedBox(height: 30),
            Text(
              "  $Av المعدل ",
              style: const TextStyle(
                fontSize: 24,
                color: Colors.blueAccent,
              ),
            )
          ],
        ),
      ),
      ),
    );
  }
}
