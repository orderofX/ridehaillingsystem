import 'package:flutter/material.dart';
import 'package:ride_uber/core/presentation/widgets/brand_colors.dart';

class LoadingDialog extends StatelessWidget {
  final String status;
  LoadingDialog({this.status});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      backgroundColor: Colors.transparent,
      child: Container(
        margin: EdgeInsets.all(16.0),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(4)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CircularProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation<Color>(BrandColors.colorAccent),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                status,
                style: TextStyle(fontSize: 15),
              ),
            )
          ],
        ),
      ),
    );
  }
}
