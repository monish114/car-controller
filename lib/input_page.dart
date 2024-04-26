import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart'; // Import the IO WebSocket client
import 'dart:convert';

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  late final IOWebSocketChannel _channel; // Declare WebSocket channel

  @override
  void initState() {
    super.initState();
    _channel = IOWebSocketChannel.connect(
        'ws://10.5.14.77:5000/ws'); // Connect to WebSocket server
  }

  @override
  void dispose() {
    _channel.sink
        .close(); // Close the WebSocket connection when the widget is disposed
    super.dispose();
  }

  void sendDataToServer(String data) {
    try {
      _channel.sink
          .add(json.encode({'data': data})); // Send data over WebSocket
      print('Data sent successfully!');
    } catch (e) {
      print('Error sending data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'VR-RC Controller',
          style: TextStyle(color: Colors.yellowAccent),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        sendDataToServer('W');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellowAccent,
                        foregroundColor: Colors.yellow,
                      ),
                      child: Icon(
                        Icons.arrow_upward_sharp,
                        color: Colors.black,
                        size: 100.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 450.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        sendDataToServer('P');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        foregroundColor: Colors.red,
                      ),
                      child: Icon(
                        Icons.back_hand,
                        color: Colors.black,
                        size: 100.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        sendDataToServer('S');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellowAccent,
                        foregroundColor: Colors.yellow,
                      ),
                      child: Icon(
                        Icons.arrow_downward_sharp,
                        color: Colors.black,
                        size: 100.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 300.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        sendDataToServer('A');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellowAccent,
                        foregroundColor: Colors.yellow,
                      ),
                      child: Icon(
                        Icons.arrow_back_sharp,
                        color: Colors.black,
                        size: 100.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        sendDataToServer('D');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellowAccent,
                        foregroundColor: Colors.yellow,
                      ),
                      child: Icon(
                        Icons.arrow_forward_sharp,
                        color: Colors.black,
                        size: 100.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
