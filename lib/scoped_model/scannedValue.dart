import 'package:scoped_model/scoped_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MainModel extends Model {
  Map<String, dynamic> data;
  String error = 'ERROR';
  String registrationID;
  bool isInternal;
  String internalStudentId;
  List<Map<String, dynamic>> history = [];

  Future<bool> getDataStatus(String registrationNumber) async {
    bool status;
    await Firestore.instance
        .collection("Tickets")
        .document(registrationNumber).get()
        .then(
      (DocumentSnapshot snapshot) {
        data = snapshot.data;
        if (snapshot.data.containsKey("hasArrived") && snapshot.data["hasArrived"] == true) {
          error = "Already Entered";
          print("ALREADY ENTERED");
          status = false;
          notifyListeners();
        } else {
          Firestore.instance
            .collection("Tickets")
            .document(registrationNumber)
            .updateData({
              "hasArrived": true
            });

          isInternal = snapshot.data['user']['isInternalStudent'];
          if(isInternal)
            internalStudentId = snapshot.data['user']['studentIdNumber'];

          Firestore.instance.collection("Arrivals").add({ "ticketId": registrationNumber });

          registrationID = registrationNumber;
          print("Welcome to TEDxJMI");
          status = true;
          notifyListeners();
        }
      },
    ).catchError(
      (e) {
        error = "Invalid Code";
        print("Not Registered");

        status = false;
        notifyListeners();
      },
    );
    print(status);
    return status;
  }

  Future<Null> getHistory() async {
    if (history.isEmpty) {
      await Firestore.instance
        .collection("Arrivals")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      for (DocumentSnapshot doc in snapshot.documents) {
        history.add(doc.data);
      }

      print(history);
    });
      
    }
  }
}
