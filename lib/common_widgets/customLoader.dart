import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loader {
  customLoader(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SpinKitThreeInOut(
        itemBuilder: (BuildContext context, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: index.isEven ? Colors.green.shade800 : Color(0xFF00357b),
            ),
          );
        },
      ),
    );
  }
}
