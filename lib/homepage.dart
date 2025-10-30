import 'package:flutter/material.dart';
import 'ansbutton.dart';
class Homepage extends StatelessWidget {
  const Homepage(this.switchscreen,{super.key});
  final void Function() switchscreen;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assests/images/1.png',
            width: 300,
            color: const Color.fromARGB(200, 255, 255, 255),
          ),
          const SizedBox(height: 30),
          const Text(
            "Hello boys! Welcome to Hell",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: (){switchscreen();},
            style: OutlinedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 174, 68, 14),
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_forward_ios_outlined),
            label: const Text("Start", style: TextStyle(fontSize: 25)),
          ),
        ],
      ),
    );
  }
}
