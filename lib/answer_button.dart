import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
    this.answerText,
    this.onTap, {
    super.key,
  });
  final String answerText;
  final void Function() onTap;
  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(10),
          backgroundColor: Colors.amber,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )),
      child: Text(
        answerText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
