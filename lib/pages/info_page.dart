import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../scoped_model/scannedValue.dart';

class InfoPage extends StatelessWidget {
  int index;
  InfoPage(this.index);

  @override
  Widget build(BuildContext context) {
    MainModel model = ScopedModel.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: ListView.builder(
          itemCount: model.history[index].length,
          itemBuilder: (context, int xindex) {
            return Container(
              padding: EdgeInsets.all(2.0),
              margin: EdgeInsets.all(2.0),
              child: Text(model.history[xindex].keys.elementAt(xindex) +
                  " : " +
                  model.history[index][
                      model.history[xindex].keys.elementAt(xindex).toString()]),
            );
          },
        ),
      ),
    );
  }
}
