import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TicketPrint extends StatelessWidget {
  final String nama;
  final String username;
  final String stasiun;
  final String tanggal;
  final String tujuan;

  const TicketPrint({
    Key? key,
    required this.nama,
    required this.username,
    required this.stasiun,
    required this.tanggal,
    required this.tujuan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BoxDecoration ticketDecoration() {
      return BoxDecoration(
        border: Border.all(width: 3.0),
        borderRadius: BorderRadius.all(
            Radius.circular(5.0) //         <--- border radius here
            ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Ticket'),
      ),
      body: Container(
        margin: EdgeInsets.all(28),
        decoration: ticketDecoration(),
        child: Padding(
            padding: const EdgeInsets.all(28.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Image.asset(
                "images/Logo_KAI.png",
                width: 200,
              ),
              const Divider(
                color: Colors.black,
                height: 25,
                thickness: 2,
                indent: 5,
                endIndent: 5,
              ),
              Row(
                children: [
                  Text(
                    'Nama : ',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ' ${nama}',
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Tanggal Keberangkatan : ',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ' ${tanggal}',
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Stasiun Keberangkatan : ',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ' ${stasiun}',
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Kota Tujuan : ',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ' ${tujuan}',
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ])),
      ),
    );
  }
}
