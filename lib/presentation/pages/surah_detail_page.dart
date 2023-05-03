import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muslim_app/utils/constants/constants.dart';

class SurahDetailPage extends StatelessWidget {
  const SurahDetailPage({super.key, required this.surah});
  final Map<String, dynamic> surah;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: SvgPicture.asset("assets/svg/pop.svg")),
        title: Text(
          surah['title'],
          style: const TextStyle(
              fontSize: 20, color: kprimaryColor, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: SvgPicture.asset("assets/svg/search.svg"))
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [TheOpening(surah: surah), const Ayat()],
        ),
      ),
    );
  }
}

class Ayat extends StatelessWidget {
  const Ayat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> ayat = [
      {
        "arabic": 'َﻦﻳِمَلٰعْلا ِّبَر ِهَّلِل ُدْمَحْلا',
        "english": "[All] praise is [due] to Allah, Lord of the worlds -"
      },
      {
        "arabic": "ِﻢﻳِحَّﺮﻟا ِنٰمْحَّﺮﻟا",
        "english": "The Entirely Merciful, the Especially Merciful,"
      }
    ];
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 20),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(10),
        shrinkWrap: true,
        itemCount: ayat.length,
        itemBuilder: (context, index) {
          final item = ayat[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff121931).withOpacity(0.05),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 13,
                      backgroundColor: kprimaryColor,
                      child: Text((index + 1).toString()),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset("assets/svg/Share.svg"),
                        const SizedBox(
                          width: 15,
                        ),
                        SvgPicture.asset("assets/svg/play.svg"),
                        const SizedBox(
                          width: 15,
                        ),
                        SvgPicture.asset("assets/svg/ayat_bookmark.svg"),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  item['arabic'],
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                      fontSize: 18,
                      fontFamily: "amiri",
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(item["english"], style: const TextStyle(fontSize: 16)),
              SizedBox(
                height: 20,
              ),
            ],
          );
        },
      ),
    );
  }
}

class TheOpening extends StatelessWidget {
  const TheOpening({
    super.key,
    required this.surah,
  });

  final Map<String, dynamic> surah;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 257,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: kprimaryColor.withOpacity(0.3),
                offset: const Offset(0, 10),
                spreadRadius: 0,
                blurRadius: 15,
              )
            ],
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xffDF98FA),
                Color(0xff9055FF),
              ],
            ),
            image: const DecorationImage(
              opacity: 0.1,
              alignment: Alignment.bottomRight,
              image: AssetImage(
                "assets/images/Quran.png",
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                surah['title'],
                style: const TextStyle(color: white, fontSize: 26),
              ),
              const Text(
                "The Opening",
                style: TextStyle(color: white, fontSize: 16),
              ),
              const SizedBox(
                width: 200,
                child: Divider(
                  color: white,
                ),
              ),
              Text(
                "${surah['subTitle']}".toUpperCase(),
                style: const TextStyle(color: white, fontSize: 14),
              ),
              const SizedBox(
                height: 20,
              ),
              SvgPicture.asset("assets/svg/sura.svg")
            ],
          ),
        )
      ],
    );
  }
}
