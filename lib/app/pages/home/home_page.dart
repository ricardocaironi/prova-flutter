import 'package:flutter/material.dart';
import 'package:prova_flutter/app/pages/home/components/home_tile.dart';



class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeTile(),
    );
  }
}
