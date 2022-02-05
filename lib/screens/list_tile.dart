import 'package:flutter/material.dart';


class ListTile extends StatelessWidget {
  Map<String, dynamic> data;

  ListTile(this.data);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (context, index) {
            String key = data.keys.elementAt(index);

            return Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(15.0),
                ),
                Text('$key : '),
                Text(data[key].toString())
              ],
            );
          }),
    );
  }
}
