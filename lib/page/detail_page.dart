import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stay_indekos/config/app_format.dart';
import 'package:stay_indekos/config/app_route.dart';
import 'package:stay_indekos/model/indekos.dart';
import 'package:stay_indekos/source/booking_source.dart';
import 'package:stay_indekos/widget/button_custom.dart';

import '../config/app_color.dart';
import '../controller/c_user.dart';
import '../model/booking.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key? key}) : super(key: key);

  final cUser = Get.put(CUser());

  final Rx<Booking> _bookedData = initBooking.obs;
  Booking get bookedData => _bookedData.value;
  set bookedData(Booking n) => _bookedData.value = n;

  // final List facilities = [
  //   {
  //     'icon': AppAsset.iconCoffee,
  //     'label': 'Lounge',
  //   },
  //   {
  //     'icon': AppAsset.iconOffice,
  //     'label': 'Office',
  //   },
  //   {
  //     'icon': AppAsset.iconWifi,
  //     'label': 'Wi-Fi',
  //   },
  //   {
  //     'icon': AppAsset.iconStore,
  //     'label': 'Store',
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    Indekos indekos = ModalRoute.of(context)!.settings.arguments as Indekos;
    BookingSource.checkIsBooked(cUser.data.id!, indekos.id)
        .then((bookingValue) {
      bookedData = bookingValue ?? initBooking;
    });
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: const Text(
          'Indekos Details',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      // bottomNavigationBar: bookingNow(indekos, context),
      bottomNavigationBar: Obx(() {
        if (bookedData.id == '') return bookingNow(indekos, context);
        return viewReceipt(context);
      }),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: ListView(
          children: [
            const SizedBox(height: 24),
            images(indekos),
            const SizedBox(height: 16),
            name(indekos, context),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(indekos.description),
            ),
            const SizedBox(height: 16),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 16),
            //   child: Text(
            //     'Facilities',
            //     style: Theme.of(context).textTheme.titleMedium!.copyWith(
            //           fontWeight: FontWeight.bold,
            //         ),
            //   ),
            // ),
            // gridFacilities(),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Facilities',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(height: 16),
            facilities(indekos),
            const SizedBox(height: 20),
            //feature
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Activities',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(height: 16),
            activities(indekos),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Container viewReceipt(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey[100]!, width: 1.5),
        ),
      ),
      height: 80,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Anda Memesan Ini.',
            style: TextStyle(color: Colors.grey),
          ),
          Material(
            color: AppColor.secondary,
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoute.detailBooking,
                  arguments: bookedData,
                );
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 36,
                  vertical: 14,
                ),
                child: Text(
                  'Lihat Tanda Terima',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container bookingNow(Indekos indekos, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey[100]!, width: 1.5),
        ),
      ),
      height: 80,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppFormat.currency(indekos.price.toDouble()),
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppColor.secondary,
                        fontWeight: FontWeight.w900,
                      ),
                ),
                const Text(
                  'per Bulan',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          ButtonCustom(
            label: 'Booking Now',
            onTap: () {
              Navigator.pushNamed(context, AppRoute.checkout,
                  arguments: indekos);
            },
          ),
        ],
      ),
    );
  }

  SizedBox facilities(Indekos indekos) {
    return SizedBox(
      height: 65,
      child: ListView.builder(
        itemCount: indekos.facilities.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          Map facilitieses = indekos.facilities[index];
          return Padding(
            padding: EdgeInsets.fromLTRB(
              index == 0 ? 16 : 8,
              0,
              index == indekos.facilities.length - 1 ? 16 : 8,
              0,
            ),
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0),
                    child: Image.network(
                      facilitieses['image'],
                      width: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(facilitieses['name']),
              ],
            ),
          );
        },
      ),
    );
  }

  SizedBox activities(Indekos indekos) {
    return SizedBox(
      height: 105,
      child: ListView.builder(
        itemCount: indekos.activities.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          Map activity = indekos.activities[index];
          return Padding(
            padding: EdgeInsets.fromLTRB(
              index == 0 ? 16 : 25,
              0,
              index == indekos.activities.length - 1 ? 16 : 25,
              0,
            ),
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      activity['image'],
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(activity['name']),
              ],
            ),
          );
        },
      ),
    );
  }

  // GridView gridFacilities() {
  //   return GridView.builder(
  //     padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
  //     itemCount: facilities.length,
  //     shrinkWrap: true,
  //     physics: const NeverScrollableScrollPhysics(),
  //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //       //jumlah fasilitas
  //       crossAxisCount: 4,
  //       crossAxisSpacing: 16,
  //       mainAxisSpacing: 16,
  //     ),
  //     itemBuilder: (context, index) {
  //       return Container(
  //         decoration: BoxDecoration(
  //           border: Border.all(color: Colors.grey[200]!),
  //           borderRadius: BorderRadius.circular(24),
  //         ),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             ImageIcon(AssetImage(facilities[index]['icon'])),
  //             const SizedBox(height: 4),
  //             Text(
  //               facilities[index]['label'],
  //               style: const TextStyle(fontSize: 13),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  Padding name(Indekos indekos, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  indekos.name,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  indekos.location,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.star, color: AppColor.starActive),
          const SizedBox(width: 4),
          Text(
            indekos.rate.toString(),
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  SizedBox images(Indekos indekos) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        itemCount: indekos.images.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(
              index == 0 ? 16 : 8,
              0,
              index == indekos.images.length - 1 ? 16 : 8,
              0,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                indekos.images[index],
                fit: BoxFit.cover,
                height: 180,
                width: 240,
              ),
            ),
          );
        },
      ),
    );
  }
}
