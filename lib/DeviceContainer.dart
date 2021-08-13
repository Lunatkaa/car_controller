import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class DeviceContainer extends StatelessWidget {
  final BluetoothDevice device;
  final BluetoothConnection connection;

  DeviceContainer({@required this.device, @required this.connection});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      color: Colors.red,
      child: Row(
        children: [
          Column(
            children: [
              Text(device.name),
              Text(device.address),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                BluetoothConnection.toAddress(null);
              },
              child: Text('CONNECT'))
        ],
      ),
    );
  }
}
