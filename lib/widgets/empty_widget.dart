import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  final String text;
  const EmptyWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 20),
          ),
          Lottie.asset(
            "assets/anim/empty.json",
            width: MediaQuery.of(context).size.width / 2.5,
            repeat: false,
          ),
        ],
      ),
    );
  }
}
