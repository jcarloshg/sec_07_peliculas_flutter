import 'package:flutter/material.dart';
import 'package:sec_07_peliculas_flutter/widgets/widgets.dart';

class CatingCards extends StatelessWidget {
  const CatingCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      width: double.infinity,
      height: 180,
      child: ListView.builder(
        itemCount: 10,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int indexk) {
          return CastCard();
        },
      ),
    );
  }
}
