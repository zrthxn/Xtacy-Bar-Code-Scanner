import 'package:flutter/material.dart';
import '../scoped_model/scannedValue.dart';
import 'package:scoped_model/scoped_model.dart';

class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MainModel model = ScopedModel.of(context);
    print("Success");
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Image.asset("assets/success.gif"),
          Container(
            padding: EdgeInsets.all(50.0),
            child: Text(
              "Success!",
              textScaleFactor: 2
            ),
          ),
          Container(
            padding: EdgeInsets.all(4.0),
            child: Text(
              "Welcome to TEDxJMI",
              textScaleFactor: 1.75,
            ),
          ),
          Container(
            padding: EdgeInsets.all(2.0),
            child: Text("Ticket ID: " + model.registrationID),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: model.isInternal ? (
              Text(
                "Internal, SID: " + model.internalStudentId,
                textScaleFactor: 1.5,
                style: TextStyle(
                  color: Color.fromRGBO(216, 0, 0, 1),
                  fontWeight: FontWeight.w600
                ),
              )
            ) : (
              Text("Non-Internal")
            )
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Amount Paid: " + model.data['txn']['baseAmount'],
              textScaleFactor: 1.25,
              style: TextStyle(
                color: Color.fromRGBO(0, 216, 0, 1),
                fontWeight: FontWeight.w600
              ),
            )
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Check the Internal student ID before allotting seats.",
              style: TextStyle(
                color: Color.fromRGBO(36, 36, 36, 0.75)
              ),
            )
          )
        ],
      ),
    );
  }
}
