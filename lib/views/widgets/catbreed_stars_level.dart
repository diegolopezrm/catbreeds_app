import 'package:flutter/material.dart';

class CatBreedStarLevel extends StatelessWidget {
  final int level;
  final bool? showText;

  const CatBreedStarLevel(
      {Key? key, required this.level, this.showText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Column(
        mainAxisAlignment:
            showText! ? MainAxisAlignment.center : MainAxisAlignment.start,
        crossAxisAlignment:
            showText! ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
                showText! ? MainAxisAlignment.center : MainAxisAlignment.start,
            children: [
              for (var i = 0; i < level; i++)
                const Icon(Icons.star, color: Colors.amber, size: 15),
            ],
          ),
          const SizedBox(height: 5),
          showText!
              ? const Text(
                  'Intelligence',
                  style: TextStyle(fontSize: 10.0),
                )
              : Text(
                  level.toString(),
                  style: const TextStyle(fontSize: 10.0),
                  textAlign: TextAlign.start,
                )
        ],
      ),
    );
  }
}
