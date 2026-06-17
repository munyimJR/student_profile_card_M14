import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_profile_ostad/models/student_model.dart';

/// Custom dialog that shows student details.
void showStudentDetailsDialog(BuildContext context, StudentModel student) {
  showDialog(
    context: context,
    barrierColor: Colors.black54,
    builder: (_) => Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      elevation: 8,
      backgroundColor: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Title ──────────────────────────────────────────────────────
            Row(
              children: [
                Icon(Icons.school_rounded,
                    color: const Color(0xFF3B4BA0), size: 22.sp),
                SizedBox(width: 8.w),
                Text(
                  'Student Details',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1A1A2E),
                  ),
                ),
              ],
            ),

            Divider(height: 24.h, thickness: 1, color: Colors.grey.shade200),

            // ── Name ───────────────────────────────────────────────────────
            _DetailRow(
              icon: Icons.person_outline,
              label: 'Name',
              value: student.name,
            ),

            SizedBox(height: 12.h),

            // ── ID ─────────────────────────────────────────────────────────
            _DetailRow(
              icon: Icons.badge_outlined,
              label: 'ID',
              value: student.studentId,
            ),

            SizedBox(height: 12.h),

            // ── Department ─────────────────────────────────────────────────
            _DetailRow(
              icon: Icons.apartment_outlined,
              label: 'Dept',
              value: student.department,
            ),

            SizedBox(height: 20.h),

            // ── Close Button ───────────────────────────────────────────────
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  'Close',
                  style: TextStyle(
                    color: const Color(0xFF3B4BA0),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

/// A single row inside the dialog showing label + value.
class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18.sp, color: const Color(0xFF3B4BA0)),
        SizedBox(width: 8.w),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 14.sp,
                color: const Color(0xFF1A1A2E),
              ),
              children: [
                TextSpan(
                  text: '$label: ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: value),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
