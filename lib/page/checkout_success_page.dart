import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stay_indekos/model/indekos.dart';
import 'package:stay_indekos/page/home_page.dart';
import 'package:stay_indekos/widget/button_custom.dart';

import '../controller/c_home.dart';

class CheckoutSuccessPage extends StatelessWidget {
  const CheckoutSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cHome = Get.put(CHome());
    Indekos indekos = ModalRoute.of(context)!.settings.arguments as Indekos;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 6, color: Colors.white),
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                indekos.cover,
                width: 190,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 46),
          Text(
            'Pembayaran Berhasil',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 12),
          Text(
            'Nikmati seluruh pengalaman baru Anda\ndi dunia yang indah ini',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.black,
                ),
          ),
          const SizedBox(height: 46),
          ButtonCustom(
            label: 'View My Booking',
            onTap: () {
              cHome.indexPage = 1;
              Get.offAll(() => HomePage());
            },
          ),
        ],
      ),
    );
  }
}
