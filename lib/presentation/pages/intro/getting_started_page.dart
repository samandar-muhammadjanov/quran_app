import 'package:flutter/material.dart';
import 'package:muslim_app/presentation/pages/home_page.dart';
import 'package:muslim_app/utils/constants/constants.dart';

class GettingStartedPage extends StatelessWidget {
  const GettingStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Quran App",
                style: TextStyle(
                    fontSize: 28,
                    color: kprimaryColor,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "Learn Quran and\nRecite once everyday",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: lightGreyText),
              ),
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset("assets/images/splash.png"),
                    Positioned(
                      bottom: 20,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          splashColor: korangeColor,
                          customBorder: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                ),
                                (route) => false);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 185,
                            height: 60,
                            decoration: const BoxDecoration(
                              color: korangeColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            child: const Text(
                              "Get Started",
                              style: TextStyle(fontSize: 18, color: white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
