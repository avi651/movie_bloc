import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
void ErrorDialog({required BuildContext context}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      actions: [
        TextButton(
          child: Text(
            'Try Again',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Theme.of(context).primaryColor),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
          child: Text(
            'Back',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Theme.of(context).colorScheme.secondary),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    ),
  );
}
