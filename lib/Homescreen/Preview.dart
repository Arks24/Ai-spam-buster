import 'package:flutter/material.dart';

class Preview extends StatelessWidget {
  const Preview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Preview ',
          style: TextStyle(
              fontSize: 26, color: Color(0xFFC50A0A), fontFamily: 'BebasNeue'),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset("assets/images/demo.jpg")),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xFFC50A0A),
                  borderRadius: BorderRadius.circular(10)),
              height: 44,
              width: 175,
              child: Center(
                child: Text(
                  "Use This Template",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Sansita',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
