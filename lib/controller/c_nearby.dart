import 'package:get/get.dart';
import 'package:stay_indekos/model/indekos.dart';

import 'package:stay_indekos/source/indekos_source.dart';

class CNearby extends GetxController {
  final _category = 'All Category'.obs;
  String get category => _category.value;
  set category(n) {
    _category.value = n;
    update();
  }

  List<String> get categories => [
        'All Category',
        'Full Facilitas',
        'Wifi',
        'Listrik',
        'Laundry',
        'PDAM',
      ];

  final _listIndekos = <Indekos>[].obs;
  // ignore: invalid_use_of_protected_member
  List<Indekos> get listIndekos => _listIndekos.value;

  getListIndekos() async {
    _listIndekos.value = await IndekosSource.getIndekos();
    update();
  }

  @override
  void onInit() {
    getListIndekos();
    super.onInit();
  }
}
