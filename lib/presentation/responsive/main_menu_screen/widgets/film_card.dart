import 'package:flutter/material.dart';
import 'package:movie_app/presentation/responsive/constants.dart';

// ignore: must_be_immutable
class FilmCard extends StatelessWidget {
  String poster;
  String title;
  FilmCard({super.key, required this.poster, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/details'),
      child: Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 143,
              height: 212,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(7),
                boxShadow: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(0.45),
                    spreadRadius: -1,
                    blurRadius: 15,
                    offset: const Offset(0, 9),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Image.asset(poster, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 8),
              child: SizedBox(
                width: 212,
                child: Text(title, style: TextStyle(fontWeight: FontWeight.w700)),
              ),
            ),
            rate
          ],
        ),
      ),
    );
  }
}

class PosterModel {
  String poster;
  String title;
  PosterModel({required this.poster, required this.title});
}
