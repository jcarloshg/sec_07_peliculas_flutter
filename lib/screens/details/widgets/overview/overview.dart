import 'package:flutter/material.dart';

class Overview extends StatelessWidget {
  const Overview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Text(
        'Anim velit nostrud proident laboris esse voluptate duis officia qui cupidatat aliqua. Consectetur consequat deserunt aliqua aliqua et anim. Cupidatat mollit pariatur mollit sint occaecat enim culpa veniam veniam aliquip. Nisi veniam nostrud duis ipsum quis qui. Deserunt velit reprehenderit mollit eu nisi ullamco ad non occaecat irure Lorem enim tempor Lorem. Id ipsum reprehenderit nisi ad enim ut sit reprehenderit deserunt labore.',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
