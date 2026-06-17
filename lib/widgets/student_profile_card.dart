import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_profile_ostad/models/student_model.dart';
import 'package:student_profile_ostad/widgets/app_dialog.dart';
import 'package:student_profile_ostad/widgets/app_snackbar.dart';
import 'package:student_profile_ostad/widgets/profile_avatar_badge.dart';

/// The white card showing all student information plus action buttons.
class StudentProfileCard extends StatelessWidget {
  final StudentModel student;

  const StudentProfileCard({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 28.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ── Avatar with badge ────────────────────────────────────────
            ProfileAvatarBadge(avatarAsset: student.avatarAsset),

            SizedBox(height: 16.h),

            // ── Name ─────────────────────────────────────────────────────
            Text(
              student.name,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF3B4BA0),
              ),
            ),

            SizedBox(height: 6.h),

            // ── Student ID ────────────────────────────────────────────────
            Text(
              'ID: ${student.studentId}',
              style: TextStyle(
                fontSize: 13.sp,
                color: Colors.grey.shade600,
                letterSpacing: 0.4,
              ),
            ),

            SizedBox(height: 4.h),

            // ── Department ────────────────────────────────────────────────
            Text(
              student.department,
              style: TextStyle(
                fontSize: 13.sp,
                color: Colors.grey.shade500,
                letterSpacing: 0.3,
              ),
            ),

            SizedBox(height: 24.h),

            // ── View Details button ───────────────────────────────────────
            _ActionButton(
              label: 'View Details',
              icon: Icons.info_outline_rounded,
              filled: true,
              onTap: () => showStudentDetailsDialog(context, student),
            ),

            SizedBox(height: 12.h),

            // ── Mark Present button ───────────────────────────────────────
            _ActionButton(
              label: 'Mark Present',
              icon: Icons.check_circle_outline_rounded,
              filled: false,
              onTap: () => showSuccessSnackBar(
                context,
                '${student.name} marked as Present ✅',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Reusable button used inside [StudentProfileCard].
class _ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool filled;
  final VoidCallback onTap;

  const _ActionButton({
    required this.label,
    required this.icon,
    required this.filled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF3B4BA0);

    return SizedBox(
      width: double.infinity,
      height: 46.h,
      child: filled
          ? ElevatedButton.icon(
              onPressed: onTap,
              icon: Icon(icon, size: 18.sp, color: Colors.white),
              label: Text(
                label,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                elevation: 0,
              ),
            )
          : OutlinedButton.icon(
              onPressed: onTap,
              icon: Icon(icon, size: 18.sp, color: Colors.green.shade600),
              label: Text(
                label,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.green.shade700,
                ),
              ),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.green.shade600, width: 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
    );
  }
}
