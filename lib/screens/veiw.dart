import 'package:flutter/material.dart';
import 'package:wigzawy/resorses/order_resors.dart';
import 'package:wigzawy/screens/list_veiw.dart';

class veiw extends StatefulWidget {

static const  String route='/veiw';
  veiw(this.pagedata);
  var pagedata;
  // veiw(pagedata, refnum, Image, id, time, cus_id, sup_name, quantity, updated_at, created_at, price, date, name);

  @override
  State<veiw> createState() => _veiwState(pagedata);
}

class _veiwState extends State<veiw> {
  _veiwState(this.refnum);
  var refnum;


  @override
Widget build(BuildContext context) {
    var refnum;
    return  Scaffold(
      appBar: AppBar(title: Text("orders"),
      ),
body: Column(children: [
  Text("refnum$refnum"),
],),


    );


    }

}