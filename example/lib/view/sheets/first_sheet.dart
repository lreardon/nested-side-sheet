import 'package:example/view/navigate_to.dart';
import 'package:example/view/sheets/custom_sheet.dart';
import 'package:example/view/sheets/second_sheet.dart';
import 'package:flutter/material.dart';
import 'package:krootl_flutter_side_menu/krootl_flutter_sheet.dart';

class FirstSheet extends StatefulWidget {
  final Size size;
  final Alignment alignment;

  const FirstSheet({
    Key? key,
    required this.size,
    required this.alignment,
  }) : super(key: key);

  @override
  State<FirstSheet> createState() => _FirstSheetState();
}

class _FirstSheetState extends State<FirstSheet> {
  String? textValue;

  @override
  Widget build(BuildContext context) => CustomSheet(
        size: widget.size,
        backgroundColor: Colors.white,
        value: 'the first sheet',
        bodyContent: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'You have called the first sheet',
              textAlign: TextAlign.center,
            ),
            TextButton(
              onPressed: () async {
                dynamic result;

                if (widget.alignment == Alignment.centerLeft) {
                  result = await NavigateTo.pushLeft(
                    context,
                    SecondSheet(size: widget.size, alignment: widget.alignment),
                  );
                }
                if (widget.alignment == Alignment.centerRight) {
                  result = await SheetWidget.of(context).pushRight(
                    SecondSheet(size: widget.size, alignment: widget.alignment),
                  );
                }

                if (widget.alignment == Alignment.bottomCenter) {
                  result = await NavigateTo.pushBottom(
                    context,
                    SecondSheet(size: widget.size, alignment: widget.alignment),
                  );
                }

                if (result is String) textValue = result;
              },
              child: Text('Navigate to another sheet'),
            ),
            const SizedBox(height: 16),
            if (textValue != null)
              Text(
                'The result of previous sheet: $textValue',
                textAlign: TextAlign.center,
              ),
          ],
        ),
      );
}