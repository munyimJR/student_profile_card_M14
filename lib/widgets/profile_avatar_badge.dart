import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileAvatarBadge extends StatelessWidget {
  final String? avatarAsset;

  const ProfileAvatarBadge({super.key, this.avatarAsset});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // ── Avatar ──────────────────────────────────────────────────────────
        CircleAvatar(
          radius: 50.r,
          backgroundColor: const Color(0xFFBFC8E8),
          backgroundImage:
              avatarAsset != null ? AssetImage(avatarAsset!) : null,
          child: avatarAsset == null
              ? Icon(
                  Icons.person,
                  size: 54.r,
                  color: const Color(0xFF3B4BA0),
                )
              : null,
        ),

        // ── "New" Badge ──────────────────────────────────────────────────────
        Positioned(
          top: -4.h,
          right: -4.w,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              'New',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
