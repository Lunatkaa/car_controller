import 'package:car_controller/ControllerPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class DeviceContainer extends StatelessWidget {
  final BluetoothDevice device;

  DeviceContainer({
    @required this.device,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  device.name,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  device.address,
                  style: TextStyle(
                    color: Colors.black38,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ElevatedButton(
              onPressed: () async {
                try {
                  BluetoothConnection _connection =
                      await BluetoothConnection.toAddress(device.address);
                  print('Connected to ${device.name}');
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ControllerPage(_connection),
                    ),
                  );
                } on Error {
                  print('ERROR');
                }
              },
              child: Text('CONNECT'),
            ),
          )
        ],
      ),
    );
  }
}
