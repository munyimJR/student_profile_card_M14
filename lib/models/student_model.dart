class StudentModel {
  final String name;
  final String studentId;
  final String department;
  final String? avatarAsset; // optional local asset path

  const StudentModel({
    required this.name,
    required this.studentId,
    required this.department,
    this.avatarAsset,
  });
}
