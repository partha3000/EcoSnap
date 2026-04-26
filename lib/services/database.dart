import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DatabaseMethods {
  Future addUserInfo(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .set(userInfoMap);
  }

  Future addUserUploadItem(
    Map<String, dynamic> userInfoMap,
    String id,
    String itemid,
  ) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .collection("Items")
        .doc(itemid)
        .set(userInfoMap);
  }

  Future addAdminItem(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Requests")
        .doc(id)
        .set(userInfoMap);
  }

  Future<Stream<QuerySnapshot>> getAdminApproval() async {
    return await FirebaseFirestore.instance
        .collection("Requests")
        .where("Status", isEqualTo: "Pending")
        .snapshots();
  }
  Future updateAdminRequest(
      String id,
      ) async {
    return await FirebaseFirestore.instance
        .collection("Requests")
        .doc(id)
        .update({"Status": "Approval"});
  }

  Future updateUserRequest(

      String id,
      String itemid,
      ) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id).collection("Items").doc(itemid)
        .update({"Status": "Approval"});
  }

  Future updateUserPoints(
      String id,
      String points,
      ) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .update({"Points": points});
  }
}
