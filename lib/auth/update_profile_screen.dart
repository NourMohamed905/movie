import 'package:flutter/material.dart';
import 'package:movie/shared/app_theme.dart';
import 'package:movie/shared/defualt_text_form.dart';
import 'package:movie/shared/defualt_elevated_button.dart';

class UpdateProfileScreen extends StatefulWidget {
  static const routeName = '/update-profile';

  @override
  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController =
      TextEditingController(text: 'John Doe');
  final TextEditingController _phoneController =
      TextEditingController(text: '+1234567890');
  final TextEditingController _passwordController = TextEditingController();

  String? _selectedAvatar;

  final List<String> avatars = [
  'assets/images/avatar_1.png',
  'assets/images/avatar_2.png',
  'assets/images/avatar_3.png',
  'assets/images/avatar_4.png',
  'assets/images/avatar_5.png',
  'assets/images/avatar_6.png',
  'assets/images/avatar_7.png',
  'assets/images/avatar_8.png',
  'assets/images/avatar_9.png',
];

  void _showAvatarPicker() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppTheme.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return FractionallySizedBox(
          heightFactor: 0.5,
          child: Container(
            padding: EdgeInsets.all(16),
            height: 200,
            child: GridView.builder(
              itemCount: avatars.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                 final isSelected = _selectedAvatar == avatars[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedAvatar = avatars[index];
                    });
                    Navigator.pop(context);
                  },
                   child: Container(
                  decoration: BoxDecoration(
                    color: isSelected
                        ?AppTheme.primary.withAlpha(60) 
                        : AppTheme.black, 
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected ? AppTheme.primary: Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(avatars[index]),
                    
                  ),
                   )
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppTheme.black,
      appBar: AppBar(
        backgroundColor: AppTheme.black,
        elevation: 0,
        title: Text('Pick Avatar', style: TextStyle(color: AppTheme.primary)),
        centerTitle: true,
        leading: IconButton(
      icon: Icon(Icons.arrow_back, color: AppTheme.primary),
      onPressed: () {
        Navigator.of(context).pop();
      },
    ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // صورة الملف الشخصي مع زر تعديل
                GestureDetector(
                  onTap: _showAvatarPicker,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 70,
                        backgroundImage: _selectedAvatar != null
                            ? AssetImage(_selectedAvatar!)
                            : AssetImage('assets/images/avatar_1.png'),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppTheme.primary,
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.all(8),
                        child: Icon(Icons.edit, color: AppTheme.black, size: 24),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: size.height * 0.05),

               
                DefualtTextForm(
                  hintText: 'Name',
                  prefixIconImageName: 'user',
                  controller: _nameController,
                  volditer: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),

                SizedBox(height: size.height * 0.02),

                // حقل رقم الهاتف
                DefualtTextForm(
                  hintText: 'Phone',
                  prefixIconImageName: 'phone',
                  controller: _phoneController,
                  volditer: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),

                SizedBox(height: size.height * 0.02),

                // حقل إعادة تعيين كلمة المرور
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text('Reset Password'),
                          content: Text(
                              'Password reset functionality goes here.'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(ctx).pop(),
                              child: Text('Close'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Text(
                      'Reset Password',
                      style: TextStyle(
                        color: AppTheme.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
// ازرار
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.red,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  // تأكيد حذف الحساب
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      backgroundColor: AppTheme.black,
                      title: Text('Confirm Delete',
                          style: TextStyle(color: AppTheme.white)),
                      content: Text(
                        'Are you sure you want to delete your account?',
                        style: TextStyle(color: AppTheme.white.withAlpha(70)),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(ctx).pop(),
                          child: Text('Cancel',
                              style: TextStyle(color: AppTheme.primary)),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(ctx).pop();
                            // TODO: تنفيذ حذف الحساب
                          },
                          child: Text('Delete',
                              style: TextStyle(color: AppTheme.red)),
                        ),
                      ],
                    ),
                  );
                },
                child: Text('Delete Account',
                    style: TextStyle(color: AppTheme.white, fontSize: 18)),
              ),
            ),
            SizedBox(height: 12),
            DefualtElevatedButton(
              label: 'Update Data',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Profile updated successfully!')),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
