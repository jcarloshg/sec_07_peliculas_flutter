import 'package:flutter/material.dart';
import 'package:sec_07_peliculas_flutter/screens/Home/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Peliculas en cines'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            CardSwiper(),
            SizedBox(height: 10),
            MovieSlider(),
            SizedBox(height: 10),
            MovieSlider(),
            SizedBox(height: 10),
            MovieSlider(),
          ],
        ),
      ),
    );
  }
}
