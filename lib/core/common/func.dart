import 'package:flutter/material.dart';

Text showRelease({required movie, required BuildContext context}) {
  String dateString = movie.releaseDate;
  DateTime dateTime = DateTime.parse(dateString);
  int year = dateTime.year;
  return Text(
    year.toString(),
    style: Theme.of(context)
        .textTheme
        .bodyMedium
        ?.copyWith(fontWeight: FontWeight.bold),
  );
}
