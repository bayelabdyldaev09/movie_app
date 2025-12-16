import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 370,
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        children: [
          Wrap(crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Checkbox(
                value: _isChecked,
                side: const BorderSide(color: Colors.grey, width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                checkColor: Color(0xFF6C63FF),
                activeColor: Colors.transparent,
                onChanged: (bool? newValue) {
                  setState(() {
                    _isChecked = newValue!;
                  });
                },
              ),
              Text('Remember Me', style: TextStyle(fontSize: 14)),
            ],
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Forget password ?',
              style: TextStyle(color: Color(0xFF6C63FF), fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
