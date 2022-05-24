import 'package:flutter/material.dart';
import 'package:sec_07_peliculas_flutter/screens/details/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'NOT-MOVIE';

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const PosterName(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
