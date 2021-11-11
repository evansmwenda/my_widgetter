import 'package:flutter/material.dart';

class DsiAppBar extends StatelessWidget with PreferredSizeWidget{
final String text;

const DsiAppBar({
  Key? key,
required this.text,
}) : super(key: key);

@override
Widget build(BuildContext context) => AppBar(
  backgroundColor: const Color(0xFF04396c),
  elevation: 1,
  leading: IconButton(
    icon: const Icon(
        Icons.arrow_back,
        color: Colors.white
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  ),
  title:  Text(text,
    style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        fontFamily: 'Montserrat',
        color: Colors.white),
  ),

);

@override
Size get preferredSize => const Size.fromHeight(56);
}