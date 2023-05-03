import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muslim_app/presentation/pages/surah_detail_page.dart';
import 'package:muslim_app/utils/constants/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<String> tabs = ['Surah', 'Para', 'Page', 'Hijb'];
    return DefaultTabController(
      initialIndex: 0,
      length: tabs.length,
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          backgroundColor: white,
          elevation: 0,
          title: const Text(
            "Quran App",
            style: TextStyle(
                fontSize: 20,
                color: kprimaryColor,
                fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/svg/drawer.svg",
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset("assets/svg/search.svg"))
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(15.0),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SaySalam(),
              const LastRead(),
              HomeTapBar(tabs: tabs),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 8,
          backgroundColor: white,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          currentIndex: currentIndex,
          selectedItemColor: kprimaryColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/svg/home.svg",
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/svg/light.svg",
              ),
              label: 'Light',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/svg/prayer.svg",
              ),
              label: 'Praying Time',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/svg/dua.svg",
              ),
              label: 'Zikr',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/svg/bookmark.svg",
              ),
              label: 'Bookmark',
            ),
          ],
        ),
      ),
    );
  }
}

class HomeTapBar extends StatelessWidget {
  const HomeTapBar({super.key, required this.tabs});
  final List<String> tabs;
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> surah = [
      {
        "title": "Al-Fatiah",
        "subTitle": "Meccan  7 verses",
        "trailing": "ةحتافلا"
      },
      {
        "title": "Al-Baqarah",
        "subTitle": "Medinian 286 verses",
        "trailing": "ةرقبلا"
      },
      {
        "title": "Al 'Imran",
        "subTitle": "Meccan 200 verses",
        "trailing": "ناﺮﻤﻋ لآ"
      },
      {
        "title": "An-Nisa",
        "subTitle": "Meccan 176 verses",
        "trailing": "ءاسنلا"
      }
    ];
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        TabBar(
          indicatorColor: kprimaryColor,
          tabs: tabs
              .map(
                (tab) => Tab(
                  child: Text(
                    tab,
                    style: const TextStyle(
                        color: kprimaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              )
              .toList(),
        ),
        SizedBox(
          height: 330,
          child: TabBarView(
              physics: const BouncingScrollPhysics(),
              children: tabs
                  .map(
                    (e) => ListView.separated(
                      separatorBuilder: (context, index) => const Divider(
                        color: Color(0xffBBC4CE),
                      ),
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: surah.length,
                      itemBuilder: (context, index) {
                        final item = surah[index];
                        return ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      SurahDetailPage(surah: item),
                                ));
                          },
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10),
                          leading: Stack(
                            alignment: Alignment.center,
                            children: [
                              SvgPicture.asset("assets/svg/star.svg"),
                              Text(
                                (index + 1).toString(),
                                style: const TextStyle(
                                    color: black, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          title: Text(
                            item['title'],
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: MyColor.blackText),
                          ),
                          subtitle: Text("${item["subTitle"]}".toUpperCase()),
                          trailing: Text(
                            item['trailing'],
                            style: const TextStyle(
                                fontFamily: 'amiri',
                                color: kprimaryColor,
                                fontWeight: FontWeight.w600),
                          ),
                        );
                      },
                    ),
                  )
                  .toList()),
        )
      ],
    );
  }
}

class LastRead extends StatelessWidget {
  const LastRead({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xffDF98FA),
            Color(0xff9055FF),
          ],
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/svg/book.svg",
                  width: 20,
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  "Last Read",
                  style: TextStyle(color: white),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Al-Fatiah",
                    style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                  Text(
                    "Ayah No: 1",
                    style: TextStyle(color: white),
                  ),
                ],
              ),
              const Spacer(),
              Image.asset(
                "assets/images/Quran.png",
                width: 200,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SaySalam extends StatelessWidget {
  const SaySalam({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Asslamualaikum",
          style: TextStyle(
            fontSize: 18,
            color: lightGreyText,
          ),
        ),
        Text(
          "Tanvir Ahassan",
          style: TextStyle(
              color: MyColor.blackText,
              fontWeight: FontWeight.w600,
              fontSize: 24),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
