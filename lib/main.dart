import 'package:flutter/material.dart';

// ============================================================
// EDIT YOUR DETAILS HERE
// Replace the placeholder text below with your own info.
// ============================================================
const String profileName = 'Your Name';
const String profileRole = 'Software Engineering Student';
const String profileBio =
    'Write a short bio about yourself here: where you study, '
    'what you are interested in, and what you want to build.';

const String profileEmail = 'your.email@example.com';
const String profilePhone = '+60 12-345 6789';
const String profileLocation = 'Kuala Lumpur, Malaysia';

const List<String> profileSkills = [
  'Skill 1',
  'Skill 2',
  'Skill 3',
  'Skill 4',
];

// Leave empty to show your initial instead of a photo.
// To use a photo later:
//   1. Put it in assets/images/ (e.g. assets/images/me.jpg)
//   2. Set the path below, e.g. 'assets/images/me.jpg'
//   3. Uncomment the `assets:` lines in pubspec.yaml
const String profileImageAsset = '';

// Accent colour for the dark theme. Change this to try others,
// e.g. Colors.purpleAccent, Colors.orangeAccent, Colors.blueAccent.
const Color accentColor = Colors.tealAccent;
// ============================================================

// Dark palette
const Color backgroundColor = Color(0xFF0D0D0D);
const Color surfaceColor = Color(0xFF1A1A1A);
const Color textColor = Color(0xFFEDEDED);
const Color mutedTextColor = Color(0xFF9E9E9E);

void main() {
  runApp(const ProfileApp());
}

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: accentColor,
          brightness: Brightness.dark,
        ).copyWith(
          primary: accentColor,
          surface: surfaceColor,
          onSurface: textColor,
        ),
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        drawerTheme: const DrawerThemeData(backgroundColor: surfaceColor),
        dividerColor: Colors.white12,
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.w600, letterSpacing: 1),
        ),
        centerTitle: true,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1, thickness: 1, color: Colors.white10),
        ),
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 32),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              children: [
                const ProfileAvatar(),
                const SizedBox(height: 20),
                Text(
                  profileName,
                  textAlign: TextAlign.center,
                  style: textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  profileRole,
                  style: textTheme.titleMedium?.copyWith(color: accentColor),
                ),
                const SizedBox(height: 36),
                const SectionTitle('About me'),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    profileBio,
                    style: textTheme.bodyLarge?.copyWith(
                      color: mutedTextColor,
                      height: 1.5,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                const SectionTitle('Contact'),
                const InfoTile(icon: Icons.email_outlined, text: profileEmail),
                const InfoTile(icon: Icons.phone_outlined, text: profilePhone),
                const InfoTile(
                  icon: Icons.location_on_outlined,
                  text: profileLocation,
                ),
                const SizedBox(height: 32),
                const SectionTitle('Skills'),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      for (final skill in profileSkills)
                        Chip(
                          label: Text(skill),
                          labelStyle: const TextStyle(color: textColor),
                          backgroundColor: surfaceColor,
                          side: BorderSide(
                            color: accentColor.withValues(alpha: 0.5),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    const hasImage = profileImageAsset != '';

    // Thin accent ring around the avatar
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: accentColor,
      ),
      child: CircleAvatar(
        radius: 70,
        backgroundColor: surfaceColor,
        backgroundImage: hasImage ? const AssetImage(profileImageAsset) : null,
        child: hasImage
            ? null
            : Text(
                profileName.isNotEmpty ? profileName[0].toUpperCase() : '?',
                style: const TextStyle(
                  fontSize: 56,
                  fontWeight: FontWeight.bold,
                  color: accentColor,
                ),
              ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 3,
            height: 18,
            decoration: BoxDecoration(
              color: accentColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            title.toUpperCase(),
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
              letterSpacing: 1.5,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  final IconData icon;
  final String text;
  const InfoTile({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      dense: true,
      leading: Icon(icon, color: accentColor),
      title: Text(text, style: const TextStyle(color: textColor, fontSize: 15)),
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.white10)),
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    profileName,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(profileRole, style: TextStyle(color: accentColor)),
                ],
              ),
            ),
          ),
          _drawerItem(
            context,
            icon: Icons.person_outline,
            title: 'Profile',
            onTap: () => Navigator.pop(context),
          ),
          _drawerItem(
            context,
            icon: Icons.settings_outlined,
            title: 'Settings',
            onTap: () => _comingSoon(context, 'Settings'),
          ),
          _drawerItem(
            context,
            icon: Icons.info_outline,
            title: 'About',
            onTap: () => _comingSoon(context, 'About'),
          ),
        ],
      ),
    );
  }

  Widget _drawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: accentColor),
      title: Text(title, style: const TextStyle(color: textColor)),
      onTap: onTap,
    );
  }

  void _comingSoon(BuildContext context, String page) {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$page page coming soon'),
        backgroundColor: surfaceColor,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
