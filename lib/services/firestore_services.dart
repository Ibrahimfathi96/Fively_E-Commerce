import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FireStoreServices {
  final _fireStore = FirebaseFirestore.instance;
  //Using singleTon Pattern => Only one object for this class
  FireStoreServices._(); //private constructor means
  // you'll be able to create any objects outside this class
  static final instance = FireStoreServices._();

  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final reference = _fireStore.doc(path);
    debugPrint('Request data: $data');
    await reference.set(data); //set => add or edit if it exists
  }

  Future<void> deleteData({required String path}) async {
    final reference = _fireStore.doc(path);
    debugPrint('Path: $path');
    await reference.delete();
  }

  //stream of collections inside a document
  Stream<T> documentsStream<T>(
      {required String path,
      required T Function(Map<String, dynamic>? data, String documentId) builder
      }) {
    final reference = _fireStore.doc(path);
    final snapShots = reference.snapshots();
    return snapShots.map((snapshot) => builder(snapshot.data(), snapshot.id));
  }

  //stream of documents inside a collection
  Stream<List<T>> collectionsStream<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentId) builder,
    ///query parameter or filter
    Query Function(Query query)? queryBuilder,
    ///sorting parameter
    int Function(T lhs, T rhs)? sort,
  }) {
    Query query = _fireStore.collection(path);
    //if there is an user's query
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final snapShots = query.snapshots();
    return snapShots.map((snapshot) {
      final result = snapshot.docs
          .map(
            (snapshot) => builder(
              snapshot.data() as Map<String, dynamic>,
              snapshot.id,
            ),
          )
          .where((value) => value != null)
          .toList();
      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }
}
