//widget pour la partie de l'icone
import 'package:flutter/material.dart';

class SectionIcone extends StatelessWidget {
  const SectionIcone({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: const Column(
                children: [
                  Icon(Icons.phone, color: Colors.brown),
                  SizedBox(height: 5),
                  Text('TEL', style: TextStyle(color: Colors.brown)),
                ],
              ),
            ),
            Container(
              child: const Column(
                children: [
                  Icon(Icons.email, color: Colors.brown),
                  SizedBox(height: 5),
                  Text('MAIL', style: TextStyle(color: Colors.brown)),
                ],
              ),
            ),
            Container(
              child: const Column(
                children: [
                  Icon(Icons.share, color: Colors.brown),
                  SizedBox(height: 5),
                  Text('PARTAGE', style: TextStyle(color: Colors.brown)),
                ],
              ),
            ),
          ],
        ));
  }
}
