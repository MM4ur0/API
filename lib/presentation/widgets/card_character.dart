import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CardCharacter extends StatefulWidget {
  const CardCharacter({Key? key}) : super(key: key);

  @override
  State<CardCharacter> createState() => _CardCharacterState();
}

class _CardCharacterState extends State<CardCharacter> {
  List<Map<String, String>> characters = [];
  int currentPage = 1;

  @override
  void initState() {
    super.initState();
    fetchCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 1,
              mainAxisSpacing: 3,
            ),
            itemCount: characters.length,
            itemBuilder: (context, index) {
              final character = characters[index];
              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    if (character['image'] != null)
                      Image.network(
                        character['image']!,
                        height: 80,
                        fit: BoxFit.contain,
                      ),
                    Text(
                      textAlign: TextAlign.center,
                      character['name'].toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      character['species'].toString(),
                      style: const TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                    Text(
                      character['gender'].toString() == 'Male'
                          ? 'Masculino'
                          : 'Femenino',
                      style: const TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                    Text(
                      character['status'].toString() == 'Alive'
                          ? 'Vivo'
                          : 'Muerto',
                      style: const TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: currentPage > 1
                  ? () {
                      setState(() {
                        currentPage--;
                      });
                      fetchCharacters();
                    }
                  : null,
              child: const Text("Anterior"),
            ),
            const SizedBox(
              width: 5,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  currentPage++;
                });
                fetchCharacters();
              },
              child: const Text("Siguiente"),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> fetchCharacters() async {
    final response = await http.get(
      Uri.parse('https://rickandmortyapi.com/api/character/?page=$currentPage'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final charactersList = data['results'];

      List<Map<String, String>> updatedCharacters = [];

      for (final character in charactersList) {
        Map<String, String> characterData = {
          'name': character['name'],
          'species': character['species'],
          'image': character['image'],
          'gender': character['gender'],
          'status': character['status']
        };
        updatedCharacters.add(characterData);
      }

      setState(() {
        characters = updatedCharacters;
      });
    } else {}
  }
}
