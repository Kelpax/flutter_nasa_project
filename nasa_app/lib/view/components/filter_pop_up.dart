import 'package:flutter/cupertino.dart';


class FilterPopUp extends StatelessWidget {
  final ValueChanged? onDateTimeChanged;

  const FilterPopUp({Key? key, this.onDateTimeChanged}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).copyWith().size.height*0.25,
      color: CupertinoColors.white,
      child: CupertinoDatePicker(
        mode: CupertinoDatePickerMode.date,
        onDateTimeChanged: onDateTimeChanged!,
        initialDateTime: DateTime.now(),
        minimumYear: 2000,
        maximumYear: 2021,
      ));
  }
}
