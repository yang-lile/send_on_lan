// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:grpc/grpc.dart' as grpc;
// import 'package:send_on_lan/communitation.dart';
// import 'package:send_on_lan/protobuf_gen/text.pbgrpc.dart';

// main(List<String> args) => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'xxx',
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   late String clientIp;
//   var serverIp = "";
//   late Future future;
//   var controller1 = TextEditingController();
//   var controller2 = TextEditingController();
//   @override
//   void initState() {
//     future = NetworkInterface.list(
//       includeLinkLocal: true,
//     ).then(
//       (value) => clientIp = value[0].addresses[0].address,
//     );

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: future,
//       builder: (context, snap) {
//         if (snap.connectionState != ConnectionState.done) {
//           return CircularProgressIndicator();
//         } else {
//           return Scaffold(
//             appBar: AppBar(
//               title: TextFormField(
//                 controller: controller1,
//                 onEditingComplete: () => this.serverIp = controller1.value.text,
//               ),
//             ),
//             bottomNavigationBar: ColoredBox(
//               color: Colors.blue,
//                           child: TextFormField(
//                 controller: controller2,
//                 onEditingComplete: () {
//                   // send
//                   var clientChannel = grpc.ClientChannel(
//                     this.serverIp,
//                   );
//                   var cc = CCClient(clientChannel);
//                   cc.send(
//                     Stream.value(
//                       OneMessage(value: controller2.text),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             body: StreamBuilder(
//               builder: (context, snap) {
//                 if (snap.connectionState == ConnectionState.active) {
//                   return ListView.builder(
//                     itemCount: MyService.messages.length,
//                     itemBuilder: (context, index) {
//                       return ListTile(
//                         title: MyService.messages[index],
//                       );
//                     },
//                   );
//                 } else if (snap.connectionState == ConnectionState.none) {
//                   return Text("data");
//                 } else {
//                   return CircularProgressIndicator();
//                 }
//               },
//             ),
//           );
//         }
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: Text('Hello World'),
          ),
        ),
      ),
    );
  }
}