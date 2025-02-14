import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/bunny_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: BackgroundWaveClipper(),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 280,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      Color(0xFFFCBF49),
                      Color(0xFFF77F00),
                      Color(0xDDDC7100)
                    ],
                  )),
                ),
              ),
              Center(
                child: Column(
                  children: [
                    const SizedBox(height: 100),
                    CircleAvatar(
                      radius: 55,
                      backgroundImage: AssetImage('assets/profile_picture.png'),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'John Doe',
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: const Text(
                        'John Doe exists. John Doe builds. John Doe innovates. What\'s next? Only time will tell...',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
