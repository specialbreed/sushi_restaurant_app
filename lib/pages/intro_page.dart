import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_restaurant_app/components/buttons.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade500,
      // backgroundColor: Color.fromARGB(255, 138, 60, 55),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
            ),
            Center(
              child: Text(
                'MUCH KITCHEN',
                style: GoogleFonts.dmSerifDisplay(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset('lib/images/cooking2.png'),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'THE TASTE OF GOOD FOOD',
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 44,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Feel the taste of one of the popular food joint from anywhere, anyday, and anytime',
              style: TextStyle(
                color: Colors.white,
                height: 2,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            MyButton(
              text: 'Get started',
              onTap: () {
                Navigator.pushNamed(context, '/menupage');
              },
            ),
          ],
        ),
      ),
    );
  }
}
