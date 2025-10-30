import 'package:flutter/material.dart';
class AnsButton extends StatelessWidget
{
  const AnsButton(this.ans,this.onTap,{super.key});
  final String ans;
  final void Function() onTap;
  @override
 Widget build(context) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 45),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      elevation: 10,
      backgroundColor: Colors.transparent, 
      shadowColor: const Color(0xFFFF4500), 
      foregroundColor: Colors.white,
    ).copyWith(
      backgroundColor: WidgetStateProperty.all(Colors.transparent),
    ),
    onPressed: onTap,
    child: Ink(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFFFD700), 
            Color(0xFFFF4500), 
            Color(0xFF8B0000), 
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.all(Radius.circular(18)),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFFF4500),
            blurRadius: 15,
            spreadRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Container(
        alignment: Alignment.center,
        child: Text(
          ans,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            shadows: [
              Shadow(
                color: Color(0xFFFFA500),
                blurRadius: 10,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
}