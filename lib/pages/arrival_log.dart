import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './drawer.dart';
import './details_page.dart';
import './info_page.dart';

import '../scoped_model/scannedValue.dart';

class ArrivalLog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MainModel model = ScopedModel.of(context);

    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("History of Entries"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Text(
              "Total: " + model.history.length.toString(),
              textScaleFactor: 1.5,
            ),
          ),
          ListView.builder(
            itemCount: model.history.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  child: GestureDetector(
                child: Text(
                  model.history[index]["ticketId"],
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return InfoPage(index);
                      }),
                    ),
              ));
            },
          )
        ],
      )
      
    );
  }
}
