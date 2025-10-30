import 'package:flutter/material.dart';
import 'package:supernatural/ansbutton.dart';
import 'package:supernatural/data/questions_different.dart';
import 'package:google_fonts/google_fonts.dart';
class Questions extends StatefulWidget {
  const Questions({required this.onSelectAns,super.key});
  final void Function(String ans) onSelectAns;  
  @override
  State<StatefulWidget> createState() {
    return _Questions();
  }
}

class _Questions extends State<Questions> {
  var currentquestionidx = 0;
  void QuestionAnswered(selectedans)
  {
    widget.onSelectAns(selectedans);
    setState(() {
      currentquestionidx++;
    });
  }
  @override
  Widget build(context) {
    final currentquestion = questions[currentquestionidx];
    return SizedBox(
      width: double.infinity,
      child : Container(
      margin: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentquestion.text, 
              style: GoogleFonts.lato(
                color:  Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold
              ) ,
              textAlign: TextAlign.center),
            const SizedBox(height: 30),
            ...currentquestion.getshuffledand().map((ans) {
              return AnsButton(ans, 
              (){
                QuestionAnswered(ans);
              }
              );  
            },),
          ],
        ),
      ),
      );
  }
}
