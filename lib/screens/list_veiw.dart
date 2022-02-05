
// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:wigzawy/resorses/order_resors.dart';
import 'package:wigzawy/screens/veiw.dart';

class order extends StatefulWidget {
  const order({ Key? key }) : super(key: key);
static const  String route='/listvew';
  @override
  State<order> createState() => _orderState();
}
class _orderState extends State<order> {
  TextEditingController refnumadd=TextEditingController();
    TextEditingController categoryadd=TextEditingController();
  TextEditingController hairtextureadd=TextEditingController();
  TextEditingController lengthadd=TextEditingController();
  TextEditingController coloradd=TextEditingController();
  TextEditingController densityadd=TextEditingController();
  TextEditingController quantityadd=TextEditingController();
  TextEditingController imgadd=TextEditingController();
List orders=[];  
bool isloading=false;
  var quantity;
@override
  void initState() {    
    // TODO: implement initState
    super.initState();
         fetchData();
  }
   fetchData() async {
   setState(() {
     isloading=true;
   });
var url="http://bestbeast.naturalwigsbuy.com/api/order_api";
var res= await http.get(Uri.parse(url));
if (res.statusCode==200){var pagedata=jsonDecode(res.body);

setState(() {
  orders=pagedata;
  isloading=false;
});}
else{
setState(() {
    orders=[];
  isloading=false;

});
}

}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [ FlatButton(  
                child: Text('new_order', style: TextStyle(fontSize: 20.0),),  
                onPressed: () {     add_order();      },  
              ),  ],
        backgroundColor: Colors.cyan,
        title: Text("orders",)),
      body: 
   getbody(),
    );
  }

  /////////////////////
 add_order(){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  addorder()),
  );
 }
////////////add/new/order


      addorder(){
        return Scaffold(
          appBar: AppBar(title: Text("add your new order..."),),
          body: Container(child: 
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
            TextField(  
            controller: refnumadd,  decoration: InputDecoration(
              border: OutlineInputBorder(),hintText: "refnum"
            ),),
            SizedBox(height: 10,),
            TextField(  
            controller: refnumadd,  decoration: InputDecoration(
              border: OutlineInputBorder(),hintText: "category"
            ),),
            SizedBox(height: 10,),
            
            TextField(  
            controller: refnumadd,  decoration: InputDecoration(
              border: OutlineInputBorder(),hintText: "length"
            ),),
            SizedBox(height: 10,),
            
            TextField(  
            controller: refnumadd,  decoration: InputDecoration(
              border: OutlineInputBorder(),hintText: "color"
            ),),
            SizedBox(height: 10,),
            
            TextField(  
            controller: refnumadd,  decoration: InputDecoration(
              border: OutlineInputBorder(),hintText: "density"
            ),),
            SizedBox(height: 10,),
            
            TextField(  
            controller: refnumadd,  decoration: InputDecoration(
              border: OutlineInputBorder(),hintText: "hairtexture"
            ),),
            SizedBox(height: 10,),
            
            TextField(  
            controller: refnumadd,  decoration: InputDecoration(
              border: OutlineInputBorder(),hintText: "quantity"
            ),),
            SizedBox(height: 10,),
            
            TextField(  
            controller: refnumadd,  decoration: InputDecoration(
              border: OutlineInputBorder(),hintText: "image"
            ),),
            SizedBox(height: 10,),
            
            FlatButton(  
                  child: Text('Add_order', style: TextStyle(fontSize: 20.0),),  
                  onPressed: () {
                  },  
                ),  
                ],
              ),
            ),
          ),
          ),
        );
      }
    
///////////////////////////////



    getbody(){

if(orders.contains(null)||orders.length<0||isloading){return
Center(
  
  child: CircularProgressIndicator());
}
      return ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context,index){return getcard(orders[index]);});}



   //itis true//    
     getcard(pagedata){
                               
                        var id=pagedata['id'];
                        var image=pagedata['image'];
                        var refnum=pagedata['refnum'];
                        var name=pagedata['name'];
                        var category=pagedata['category'];
                        var color=pagedata['color'];
                        var capsize=pagedata['capsize'];
                        var cusId=pagedata['cusId'];
                        var density=pagedata['density'];
                        var createdAt=pagedata['createdAt'];
                        var updatedAt=pagedata['updatedAt'];
                        var length=pagedata['length'];
                        var texture=pagedata['texture'];
                        var captype=pagedata['captype'];                        
        return Card(child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
         trailing: Padding(
         padding: const EdgeInsets.all(20.0),
        child:   Row(  
                mainAxisSize: MainAxisSize.min,   
        children: [ 
     //icon eye///
       IconButton(   iconSize: 20,   onPressed: () {  Navigator.push(context, MaterialPageRoute(  
       builder: (context) =>item_details(context, image, id, refnum, name, texture, category, color,
      capsize, quantity,cusId,density,createdAt,updatedAt,length,captype),
            ), ); }, icon: Icon(Icons.remove_red_eye_sharp)),  
            //icon edit//
       IconButton(onPressed: () {}, icon: Icon(Icons.edit),   iconSize: 20,  ),
   //icon delet//
       IconButton(onPressed: () {}, icon: Icon(Icons.delete),    iconSize: 20,  ),
     ],           ),
),              

title: Row(children: [
  Container(width: 60,height: 60,decoration: BoxDecoration(color: Colors.cyan,
borderRadius: BorderRadius.circular(60/2),
image:DecorationImage(image: NetworkImage(image.toString()),fit: BoxFit.cover) ,
),),
SizedBox(width: 20,),
Column(
    crossAxisAlignment:CrossAxisAlignment.start,
  children: [
    Text(id.toString(),style: TextStyle(color: Colors.grey),),
      SizedBox(height: 10,),
  Text(refnum.toString(),style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
],),
],),
          ),
        ),);}
        //////////////
        ///
item_details(context, image, id, refnum, name, texture, category, color, capsize,
    quantity,cusId,density,createdAt,updatedAt,length,captype){
    return Scaffold
    (      body: 
    
    Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Image.network("$image",height: 150,),
            ),
                        Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('id: $id',style: TextStyle(fontSize: 20),),
                      ),  
                                Divider(),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Text("name:   "),
                       ) , Text('$name',style: TextStyle(fontSize: 20)),     
                                                     Divider(),
        
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Text("refnum:   "),
                       ) ,Text('$refnum',style: TextStyle(fontSize: 20)),  
                                                       Divider(),
        
        
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("textutre:   "),
                      ) , Text('$texture',style: TextStyle(fontSize: 20)),  
                                                        Divider(),
        
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("category:   "),
                      ) ,Text('$category',style: TextStyle(fontSize: 20)), 
                                                       Divider(),
        
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Text("capsize:   "),
                         ) ,Text('$capsize',style: TextStyle(fontSize: 20)),  
                                                         Divider(),
        
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Text("quantity:   "),
                       ) , Text('$quantity',style: TextStyle(fontSize: 20)),
                                                         Divider(),
        
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("color:   "),
                      ) ,  Text('$color',style: TextStyle(fontSize: 20)), 
                                                       Divider(),
        
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Text("cusid:   "),
                         ),
                       ) ,Text('$cusId',style: TextStyle(fontSize: 20)), 
                                                        Divider(),
        
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("density:   "),
                      ) ,  Text('$density',style: TextStyle(fontSize: 20)), 
                                                       Divider(),
        
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("createdAt:   "),
                      ) ,  Text('$createdAt',style: TextStyle(fontSize: 20)),    
                               Divider(),
        
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("updatedAt:   "),
                      ) ,   Text('$updatedAt',style: TextStyle(fontSize: 20)),    
                                                    Divider(),
        
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("length:   "),
                      ) , Text('$length',style: TextStyle(fontSize: 20)),       
                                                 Divider(),
        
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("capacity:   "),
                      ) ,   Text('$captype',style: TextStyle(fontSize: 20)),   
                                                     Divider()  ,        
Padding(
  padding: const EdgeInsets.all(20.0),
  child:   FlatButton(  
  
                  child: Text('ok', style: TextStyle(fontSize: 20.0),),  
  
                  onPressed: () {
                    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  order()),
  );
                  },  
  
                ),
),  

        ],),
      )
      
        //  Expanded(
      //   child: ListView(
        
      //     children: [
        
                  
      //                                 Text('id: $id',style: TextStyle(fontSize: 20),),  
      //                               Divider(),
        
      //                 Text("name:   ") , Text('$name',style: TextStyle(fontSize: 20)),                                   Divider(),
        
      //                  Text("refnum:   ") ,Text('$refnum',style: TextStyle(fontSize: 20)),                                  Divider(),
        
        
      //                 Text("textutre:   ") , Text('$texture',style: TextStyle(fontSize: 20)),                                    Divider(),
        
      //                 Text("category:   ") ,Text('$category',style: TextStyle(fontSize: 20)),                                  Divider(),
        
      //                    Text("capsize:   ") ,Text('$capsize',style: TextStyle(fontSize: 20)),                                  Divider(),
        
      //                  Text("quantity:   ") , Text('$quantity',style: TextStyle(fontSize: 20)),                                  Divider(),
        
      //                 Text("color:   ") ,  Text('$color',style: TextStyle(fontSize: 20)),                                  Divider(),
        
      //                  Text("cusid:   ") ,Text('$cusId',style: TextStyle(fontSize: 20)),                                  Divider(),
        
      //                 Text("density:   ") ,  Text('$density',style: TextStyle(fontSize: 20)),                                  Divider(),
        
      //                  Text("createdAt:   ") ,  Text('$createdAt',style: TextStyle(fontSize: 20)),                                  Divider(),
        
      //                 Text("updatedAt:   ") ,   Text('$updatedAt',style: TextStyle(fontSize: 20)),                                  Divider(),
        
      //                 Text("length:   ") , Text('$length',style: TextStyle(fontSize: 20)),                                  Divider(),
        
      //                 Text("capacity:   ") ,   Text('$captype',style: TextStyle(fontSize: 20)),                                  Divider(),
        
        
        
      //     ],
      //   ),
      // ),

    );




      // return Scaffold(
      //   appBar: AppBar(title: Text("order_datails"),),
      //   body:   
      //   Center(
          
      //     child: 
          
      //     Card(
      //       child: Row(
      //         children: [
      //           Card(
      //             child: Column(
          
      //               children: [  
                                
      //               Card(
      //                 child: Row(children: [
                        
      //                   Text("id:   ") ,
      //                               Text('$id',style: TextStyle(fontSize: 20),),  
      //                             ],),
      //               ),
      //               Divider(),
      //           Card(
      //             child: Row(children: [ 
      //               Text("name:   ") , Text('$name',style: TextStyle(fontSize: 20)), 
      //             ],),
      //           ),
      //                             Divider(),
            
      //           Card(
      //             child: Row(children: [ 
      //                Text("refnum:   ") ,Text('$refnum',style: TextStyle(fontSize: 20)),
      //             ],),
      //           ),
      //                             Divider(),
            
      //           Card(
      //             child: Row(children: [ 
      //               Text("textutre:   ") , Text('$texture',style: TextStyle(fontSize: 20)),  
      //             ],),
      //           ),
      //                             Divider(),
            
      //           // ignore: prefer_const_constructors
      //           Card(
      //             child: Row(children: [    
      //               Text("category:   ") ,Text('$category',style: TextStyle(fontSize: 20)),
      //             ],),
      //           ),
      //                             Divider(),
            
      //           Card(
      //             child: Row(children: [ 
      //                  Text("capsize:   ") ,Text('$capsize',style: TextStyle(fontSize: 20)),
      //             ],),
      //           ),
      //                             Divider(),
            
      //           Card(
      //             child: Row(children: [  
      //                Text("quantity:   ") , Text('$quantity',style: TextStyle(fontSize: 20)),
      //             ],),
      //           ),
      //                             Divider(),
            
      //           Card(
      //             child: Row(children: [  
      //               Text("color:   ") ,  Text('$color',style: TextStyle(fontSize: 20)),
                  
      //             ],),
      //           ),
      //                             Divider(),
            
      //           Card(
      //             child: Row(children: [   
      //                Text("cusid:   ") ,Text('$cusId',style: TextStyle(fontSize: 20)),
                  
      //             ],),
      //           ),
      //                             Divider(),
            
      //           Card(
      //             child: Row(children: [  
      //               Text("density:   ") ,  Text('$density',style: TextStyle(fontSize: 20)),
                  
      //             ],),
      //           ),
      //                             Divider(),
            
      //           Card(
      //             child: Row(children: [ 
      //                Text("createdAt:   ") ,  Text('$createdAt',style: TextStyle(fontSize: 20)),
                  
      //             ],),
      //           ),
      //                             Divider(),
            
      //           Card(
      //             child: Row(children: [ 
      //               Text("updatedAt:   ") ,   Text('$updatedAt',style: TextStyle(fontSize: 20)),
                  
      //             ],),
      //           ),
      //                             Divider(),
            
      //           Card(
      //             child: Row(children: [   
      //               Text("length:   ") , Text('$length',style: TextStyle(fontSize: 20)),
                  
      //             ],),
      //           ),
      //                             Divider(),
            
      //           Card(
      //             child: Row(children: [ 
      //               Text("capacity:   ") ,   Text('$captype',style: TextStyle(fontSize: 20)),
                  
      //             ],),
      //           ),
                
            
                
      //             ],),
      //           ),
      //           SizedBox(
      //             child: Card(
      //               child: 
      //             //   Column(children: [Row(children: [   Text('$image'),
      //             // ],),],),
      //             ClipRRect(
      //               borderRadius: BorderRadius.circular(5),
      //               child: Image.network(
      //                 '$image',
      //                 width: 200,
      //                 height: 200,
      //               ),
      //             ),

      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // );
    }
}


// Widget showdata(context, image, id, refnum, name, texture, category, color, capsize,
//     quantity){
// return  

// Container(
 
//   child:   Column(children: [  

//     Row(children: [//    Text('$image'),
// ],),
//     Row(children: [
//   Text('id:$id',style: TextStyle(fontSize: 20),),  
// ],),
// Row(children: [  Text('name:$name'), 
// ],),
// Row(children: [  Text('refnum:$refnum'),
// ],),
// Row(children: [  Text('texture:$texture'),  
// ],),
// Row(children: [    Text('category:$category'),
// ],),
// Row(children: [    Text('capsize:$capsize'),
// ],),
// Row(children: [    Text('quantity:$quantity'),
// ],),
// Row(children: [    Text('color:$color'),

// ],),


//   //Text('id:$id'),  
//   // Text('refnum:$refnum'),
//   // Text('name:$name'), 
//   // Text('texture:$texture'),  
//     // Text('category:$category'),
//     // Text('capsize:$capsize'),
//     // Text('quantity:$quantity'),
//     // Text('color:$color'),
// ButtonBar(children: [Text("data",)],)


//   ],),






// );

// }

















// (){SnackBar snackBar = SnackBar(
                //     content: Text(refnum.toString())
                // );
                // ScaffoldMessenger.of(context).showSnackBar(snackBar);