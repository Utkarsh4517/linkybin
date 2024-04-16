import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:linkybin/core/logger.dart';
import 'package:linkybin/src/home/data/model/linkybin.model.dart';

class FirebaseRepository {
  static Future<bool> saveLink({required LinkyBinModel linkyBinModel}) async {
    final firestore = FirebaseFirestore.instance;
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final userLinksCollection = firestore.collection('users').doc(uid).collection('links');

    try {
      await userLinksCollection.add(linkyBinModel.toMap());
      PrintLog.print('LinkyBinModel successfully stored!');
      return true;
    } catch (e) {
      PrintLog.print('Failed to store LinkyBinModel: $e');
      return false;
    }
  }

  static Stream<List<LinkyBinModel>> fetchLinkyBinModels() {
    final firestore = FirebaseFirestore.instance;
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final userLinksCollection = firestore.collection('users').doc(uid).collection('links');
    return userLinksCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return LinkyBinModel.fromMap(doc.data());
      }).toList();
    });
  }
}
