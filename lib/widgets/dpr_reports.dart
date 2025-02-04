import 'package:dpr_dumy/constant/custom_inputtextfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DprReport extends StatefulWidget {
  const DprReport({super.key});

  @override
  State<DprReport> createState() => _DprReportState();
}

class _DprReportState extends State<DprReport> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(

          child: Row(
            children: [
              Text("Data_date "),
              SizedBox(width: 80,),
              Container(
                height: size.height*0.06,
                width: size.width*0.12,
                child: Dob_PickerFormFields(
                  size: size,
                   controller: controller,
                // controller: registerationController.dobController,
                hintText: "Select date",
                onTap: () async {
                  selectedDate();
                },
                // validator: (value) => dodValidator(value, context),
                // labelText: translation(context).dateOfBirth,
                prefixIcon: Icon(Icons.calendar_month)
                  )),
                  SizedBox(width: 10,),
              ElevatedButton(onPressed: (){}, child: Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }
  Future<void> selectedDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate:  DateTime(
          2022),
      firstDate: DateTime(
          1990), //DateTime.now() - not to allow to choose before today.,
      lastDate: DateTime(2022, 12),
      builder: (context, child) {
        return Theme(
            data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    onSurface: Colors.black),
                textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(primary: Colors.red))),
            child: child!);
      },
    );
    if (pickedDate != null) {
      print(pickedDate);
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      print(formattedDate);

      setState(() {
        controller.text = formattedDate;
        // _dobController.text = formattedDate;
      });
    } else {
      print("Date in Not Selected");
      Fluttertoast.showToast(msg: "Date in Not Selected");
    }
  }
}