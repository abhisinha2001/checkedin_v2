import 'package:checkedin_v2/src/models/visitor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  //Get
  Stream<List<Visitor>> getEntries() {
    return _db
        .collection('visitors')
        .orderBy('createdOn')
        .limit(1)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Visitor.fromMap(doc.data())).toList());
  }

  // Create
  Future<void> setVisitor(Visitor visitor) {
    return _db.collection('visitors').add(visitor.toMap());
  }

  Future<void> removeVisitor(String entryId) {
    return _db.collection('visitors').doc(entryId).delete();
  }
}
