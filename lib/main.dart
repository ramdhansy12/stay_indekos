import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:stay_indekos/config/app_route.dart';
import 'package:stay_indekos/page/checkout_page.dart';
import 'package:stay_indekos/page/checkout_success_page.dart';
import 'package:stay_indekos/page/detail_booking_page.dart';
import 'package:stay_indekos/page/detail_page.dart';
import 'package:stay_indekos/page/home_page.dart';
import 'package:stay_indekos/page/intro_page.dart';
import 'package:stay_indekos/page/profile_page.dart';
import 'package:stay_indekos/page/search_page.dart';
import 'package:stay_indekos/page/signin_page.dart';
import 'package:stay_indekos/page/signup_page.dart';

import 'config/app_color.dart';
import 'config/session.dart';
import 'firebase_options.dart';
import 'model/user.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initializeDateFormatting('en_US');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: AppColor.backgroundScaffold,
        primaryColor: AppColor.primary,
        colorScheme: const ColorScheme.light(
          primary: AppColor.primary,
          secondary: AppColor.secondary,
        ),
      ),
      routes: {
        '/': (context) {
          return FutureBuilder(
            future: Session.getUser(),
            builder: (context, AsyncSnapshot<User> snapshot) {
              if (snapshot.data == null || snapshot.data!.id == null) {
                return const IntroPage();
              } else {
                return HomePage();
              }
            },
          );
        },
        AppRoute.intro: (context) => const IntroPage(),
        AppRoute.home: (context) => HomePage(),
        AppRoute.signin: (context) => SigninPage(),
        AppRoute.signup: (context) => SignUpPage(),
        AppRoute.detail: (context) => DetailPage(),
        AppRoute.checkout: (context) => CheckoutPage(),
        AppRoute.checkoutSuccess: (context) => const CheckoutSuccessPage(),
        AppRoute.detailBooking: (context) => const DetailBookingPage(),
        AppRoute.search: (context) => const SearchPage(),
        AppRoute.profile: (context) => const ProfilePage(),
      },
    );
  }
}
