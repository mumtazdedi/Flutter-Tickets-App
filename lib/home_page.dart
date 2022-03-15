import 'package:flutter/material.dart';
import 'package:flutter_navigation_app/ticket_print.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  final String username;
  HomePage({Key? key, required this.username}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController dateinput = TextEditingController();
  //text editing controller for text field

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  String _namaLengkap = "";
  String _stasiun = "";
  String _tanggal = "";
  String _tujuan = "";
  String _kereta = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Utama'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              children: [
                Text(
                    "Hai ${widget.username}\nSelamat Datang Di Halaman Pemesanan Tiket Kereta Api",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24)),
                SizedBox(height: 24),
                Text("Lengkapi Data Tiket Anda"),
                SizedBox(
                  height: 12,
                  width: 20,
                ),
                _buildForm(),
                SizedBox(
                  height: 24,
                  width: 20,
                ),
                TextField(
                  controller: dateinput, //editing controller of this TextField
                  decoration: InputDecoration(
                      icon: Icon(Icons.calendar_today), //icon of text field
                      labelText: "Enter Date" //label text of field
                      ),
                  readOnly:
                      true, //set it true, so that user will not able to edit text
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(
                            2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));

                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                        dateinput.text = formattedDate;
                        _tanggal = dateinput
                            .text; //set output date to TextField value.
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                ),
                _buildButtonSubmit(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _formInput(
      {required String hint,
      required String label,
      required Function(String value) setStateInput,
      int maxLines = 1}) {
    return TextFormField(
      enabled: true,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        contentPadding: const EdgeInsets.all(32.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.blue),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
      onChanged: setStateInput,
    );
  }

  Widget _buildForm() {
    return Column(
      children: [
        SizedBox(height: 12),
        _formInput(
            hint: "Masukkan Nama Lengkap",
            label: "Nama *",
            setStateInput: (value) {
              _namaLengkap = value;
            }),
        SizedBox(height: 12),
        _formInput(
            hint: "Masukkan Nama Stasiun",
            label: "Stasiun *",
            setStateInput: (value) {
              _stasiun = value;
            }),
        SizedBox(height: 12),
        _formInput(
            hint: "Masukkan Kota Tujuan",
            label: "Kota *",
            setStateInput: (value) {
              _tujuan = value;
            }),
      ],
    );
  }

  Widget _buildButtonSubmit() {
    return Container(
      padding: EdgeInsets.all(28),
      child: ElevatedButton(
        onPressed: () {
          if (_namaLengkap == "") {
            SnackBar snackBar = SnackBar(
              content: Text("* data tidak boleh kosong"),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return TicketPrint(
                  nama: _namaLengkap,
                  username: widget.username,
                  stasiun: _stasiun,
                  tanggal: _tanggal,
                  tujuan: _tujuan);
            }));
          }
        },
        child: Text('Submit'),
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            textStyle: TextStyle(fontSize: 16)),
      ),
    );
  }
}
