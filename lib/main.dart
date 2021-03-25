import 'dart:io';

import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart' as grpc;
import 'package:send_on_lan/communitation.dart';
import 'package:send_on_lan/protobuf_gen/text.pbgrpc.dart';

main(List<String> args) {
  final server = grpc.Server([MyService()]);
  server.serve(port: 8080);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'xxx',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String clientIp;
  var serverIp = "???";
  late Future future;
  var controller1 = TextEditingController();
  var controller2 = TextEditingController();

  @override
  void initState() {
    future = NetworkInterface.list(
      includeLinkLocal: true,
    ).then(
      (value) {
        debugPrint(value.toString());
        return clientIp = value[0].addresses[0].address;
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snap) {
        if (snap.connectionState != ConnectionState.done) {
          return CircularProgressIndicator();
        } else {
          return Scaffold(
            appBar: AppBar(title: Text(clientIp)),
            body: Column(
              children: [
                TextFormField(
                  controller: controller1,
                  onEditingComplete: () =>
                      this.serverIp = controller1.value.text,
                ),
                TextFormField(
                  controller: controller2,
                  onEditingComplete: () {
                    // send
                    var clientChannel = grpc.ClientChannel(
                      this.serverIp,
                      port: 8080,
                      options: const grpc.ChannelOptions(
                        credentials: grpc.ChannelCredentials.insecure(),
                      ),
                    );
                    var stub = CCClient(
                      clientChannel,
                      options: grpc.CallOptions(
                        timeout: Duration(seconds: 30),
                      ),
                    );
                    stub.send(
                      Stream.value(
                        OneMessage(value: controller2.text),
                      ),
                    );
                    debugPrint(serverIp);
                  },
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: MyService.messages.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 50.0,
                        width: 300.0,
                        alignment: Alignment.center,
                        child: Text(MyService.messages[index]),
                      );
                    },
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
                child: Icon(Icons.download_rounded),
                onPressed: () {
                  setState(() {
                    print(MyService.messages);
                    MyService.messages.last = "!${MyService.messages.last}";
                  });
                }),
          );
        }
      },
    );
  }
}
