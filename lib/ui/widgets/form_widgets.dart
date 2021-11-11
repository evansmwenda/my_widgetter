import 'package:flutter/material.dart';

class DsiTextField2 extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final TextInputType? textInputType;
  final IconData? leading;

  const DsiTextField2({
    Key? key,
    required this.controller,
    required this.labelText,
    this.leading,
    this.textInputType,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputType ?? TextInputType.text,
      controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(leading),
          labelText: labelText,
          border: const OutlineInputBorder(
            // borderRadius: BorderRadius.circular(4.0),
          ),
        ),);
  }
}


class DsiTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final TextInputType? textInputType;
  final IconData? leading;

  const DsiTextFormField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.leading,
    this.hintText='',
    this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: TextFormField(
          keyboardType: textInputType ?? TextInputType.text,
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: labelText,
            hintText: hintText,
            prefixIcon: Icon(leading),
            // suffixIcon: trailing != null
            //     ? GestureDetector(
            //   onTap: trailingTapped,
            //   child: trailing,
            // )
            //     : Container(),
          ),
        ),
      ),
    );
  }
}

class DsiDropdown extends StatefulWidget {
  final String labelText;
  final List<String> dropdownNamesList;
  final Function(String) onSelectedChanged;

  const DsiDropdown({
    required this.labelText,
    required this.dropdownNamesList,
    required this.onSelectedChanged,
  });

  @override
  _DsiDropdownState createState() => _DsiDropdownState();
}

class _DsiDropdownState extends State<DsiDropdown> {
  String? _accountName;
  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
      height: 60,
      width: 100,
      // color: Colors.red,
      child: InputDecorator(
        decoration:  InputDecoration(
          prefixIcon: const Icon(Icons.dangerous),
          labelText: widget.labelText,
          border: const OutlineInputBorder(
            // borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: SizedBox(
          width: 20,
          height: 50,
          child: DropdownButtonHideUnderline(
            key: UniqueKey(),
            child: DropdownButton<String>(
              focusColor: Colors.blue,
              value: _accountName,
              //elevation: 5,
              style: const TextStyle(color: Colors.white),
              iconEnabledColor: Colors.blue[700],
              items: widget.dropdownNamesList
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      value,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                );
              }).toList(),
              hint:  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  widget.labelText,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ),
              onChanged: (String? value) async {
                setState(() {
                  _accountName = value!;
                });
                widget.onSelectedChanged(value!);
              },
            ),
          ),
        ),
      ),
    );
  }
}
