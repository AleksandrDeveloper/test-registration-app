import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Color bacgroundColor;
  final Color textColor;
  final String title;
  final Function() onTab;
  const ButtonWidget({
    required this.title,
    required this.onTab,
    required this.textColor,
    required this.bacgroundColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
          color: bacgroundColor,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}
