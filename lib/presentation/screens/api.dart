import 'package:api/presentation/widgets/card_character.dart';
import 'package:flutter/material.dart';

class Api extends StatelessWidget {
  const Api({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' API: Rick and Morty'),
      ),
      body: const CardCharacter(),
    );
  }
}
