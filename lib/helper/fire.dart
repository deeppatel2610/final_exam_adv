import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_exam_adv/model/contact%20_model.dart';

class Fire {
  Fire._();

  static Fire fire = Fire._();

  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<void> addDataFire(ContactModel model) async {
    await _fireStore
        .collection("user")
        .doc(model.id.toString())
        .set(ContactModel.toMap(model));
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readDataFire() {
    return _fireStore.collection("user").snapshots();
  }
}
