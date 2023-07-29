import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stay_indekos/model/indekos.dart';

class IndekosSource {
  static Future<List<Indekos>> getIndekos() async {
    var result = await FirebaseFirestore.instance.collection('Indekos').get();
    return result.docs.map((e) => Indekos.fromJson(e.data())).toList();
  }
}
