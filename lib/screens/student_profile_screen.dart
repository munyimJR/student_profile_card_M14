import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_profile_ostad/models/student_model.dart';
import 'package:student_profile_ostad/widgets/student_profile_card.dart';
import 'package:student_profile_ostad/widgets/student_profile_shimmer.dart';

class StudentProfileScreen extends StatefulWidget {
  const StudentProfileScreen({super.key});

  @override
  State<StudentProfileScreen> createState() => _StudentProfileScreenState();
}

class _StudentProfileScreenState extends State<StudentProfileScreen> {
  bool _isLoading = true;

  // ── Sample student data ────────────────────────────────────────────────────
  final StudentModel _student = const StudentModel(
    name: 'MM Polash',
    studentId: 'DIU-2023-2026',
    department: 'Computer Science & Engineering',
  );

  @override
  void initState() {
    super.initState();
    // Simulate a 2.5-second loading period
    Future.delayed(const Duration(milliseconds: 2500), () {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F5FB),
      appBar: AppBar(
        title: Text(
          'Student Profile',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF3B4BA0),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: _isLoading
                ? const StudentProfileShimmer(key: ValueKey('shimmer'))
                : StudentProfileCard(
                    key: const ValueKey('card'),
                    student: _student,
                  ),
          ),
        ),
      ),
    );
  }
}
