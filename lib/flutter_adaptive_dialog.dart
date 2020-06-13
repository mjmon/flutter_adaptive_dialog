library flutter_adaptive_dialog;

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
 * For Displaying 2 Options for Confirmation
 */
Future<bool> showOptionAlertDialog({
  @required BuildContext context,
  @required String title,
  @required String content,
  @required String negativeText,
  @required String positiveText,
}) async {
  bool selected = false;
  if (Platform.isIOS) {
    selected = await showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(negativeText),
            isDefaultAction: true,
            onPressed: () => Navigator.of(context).pop(false),
          ),
          CupertinoDialogAction(
            child: Text(positiveText),
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
      ),
    );
    return selected;
  }

  selected = await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            FlatButton(
              child: Text(negativeText),
              onPressed: () => Navigator.of(context).pop(false),
            ),
            FlatButton(
              child: Text(positiveText),
              onPressed: () => Navigator.of(context).pop(true),
            ),
          ],
        ),
      ) ??
      false;
  return selected;
}

/*
 * For Simple Display with no options and has one button for closing
 */
Future<void> showAlertDialog({
  @required BuildContext context,
  @required String title,
  @required String content,
  @required String defaultActionText,
}) async {
  if (Platform.isIOS) {
    return await showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(defaultActionText),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  return await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        FlatButton(
          child: Text(defaultActionText),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    ),
  );
}
