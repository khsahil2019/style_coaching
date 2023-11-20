import 'package:flutter/material.dart';

class DatePickerField extends StatefulWidget {
  final TextEditingController controller;

  const DatePickerField({Key? key, required this.controller}) : super(key: key);

  @override
  _DatePickerFieldState createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != DateTime.now()) {
      setState(() {
        widget.controller.text = pickedDate.toString().split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Date of Birth',
              style: TextStyle(color: Colors.purple),
            ),
            SizedBox(width: 8),
          ],
        ),
        SizedBox(height: 8),
        TextFormField(
          controller: widget.controller,
          readOnly: true,
          decoration: InputDecoration(
            hintText: 'Select your date of birth',
            border: OutlineInputBorder(),
            suffixIcon: GestureDetector(
                onTap: () {
                  _selectDate(context);
                },
                child: Icon(Icons.calendar_month)),
          ),
        ),
      ],
    );
  }
}
