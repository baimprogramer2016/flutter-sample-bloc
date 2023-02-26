import 'package:flutter/material.dart';

import 'center_widget.dart';

class DataWidget extends StatelessWidget {
  const DataWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.red,
      ),
      width: 200,
      height: 100,
      child: const CenterWidget(),
    );
  }
}
