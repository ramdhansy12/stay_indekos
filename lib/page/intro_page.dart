import 'package:flutter/material.dart';
import 'package:stay_indekos/config/app_asset.dart';
import 'package:stay_indekos/config/app_route.dart';
import 'package:stay_indekos/widget/button_custom.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AppAsset.bgIntro,
            fit: BoxFit.cover,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black,
                  Colors.transparent,
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mulai Hidup Baru\nYang Lebih Baik',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Lebih dari sekedar indekos',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                ),
                const SizedBox(height: 30),
                ButtonCustom(
                  label: 'Ayo Mulai',
                  onTap: () {
                    Navigator.pushReplacementNamed(context, AppRoute.signin);
                  },
                  isExpand: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
