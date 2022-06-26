import 'package:flutter/material.dart';

class NavWidget extends StatelessWidget {
  final String textTitle;
  final String buttonTitle;
  final Function() onTab;
  const NavWidget({
    required this.buttonTitle,
    required this.onTab,
    required this.textTitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textTitle,
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                color: const Color(0xffffffff),
              ),
        ),
        TextButton(
          onPressed: onTab,
          child: Text(
            buttonTitle,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
