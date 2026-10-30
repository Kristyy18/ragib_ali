import 'package:flutter/material.dart';

import 'biography_page.dart';
import 'education_page.dart';
import 'achievements_page.dart';
import 'philanthropy_page.dart';
import 'institutions_page.dart';

class FeaturesPage extends StatelessWidget {
  const FeaturesPage({super.key});

  static const Color green = Color(0xFF087443);

  @override
  Widget build(BuildContext context) {
    final List<_FeatureItem> features = [
      _FeatureItem(
        title: 'Biography',
        subtitle: 'Read his life story',
        icon: Icons.menu_book_rounded,
        color: const Color(0xFF087F8C),
        page: const BiographyPage(),
      ),
      _FeatureItem(
        title: 'Education',
        subtitle: 'Education and learning',
        icon: Icons.school_rounded,
        color: const Color(0xFF3267B2),
        page: const EducationPage(),
      ),
      _FeatureItem(
        title: 'Achievements',
        subtitle: 'Awards and achievements',
        icon: Icons.emoji_events_rounded,
        color: const Color(0xFFC28A22),
        page: const AchievementsPage(),
      ),
      _FeatureItem(
        title: 'Philanthropy',
        subtitle: 'Charity and social work',
        icon: Icons.volunteer_activism_rounded,
        color: const Color(0xFF8053A6),
        page: const PhilanthropyPage(),
      ),
      _FeatureItem(
        title: 'Institutions',
        subtitle: 'Educational institutions',
        icon: Icons.account_balance_rounded,
        color: const Color(0xFF278052),
        page: const InstitutionsPage(),
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F8F5),
      appBar: AppBar(
        backgroundColor: green,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Dashboard',
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Explore More',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: green,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Choose a section to learn more.',
                      style: TextStyle(fontSize: 13, color: Colors.black54),
                    ),
                  ),
                  const SizedBox(height: 18),

                  Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 560),
                      child: GridView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: features.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 14,
                              mainAxisSpacing: 12,
                              mainAxisExtent: 120,
                            ),
                        itemBuilder: (context, index) {
                          final feature = features[index];

                          return Card(
                            margin: EdgeInsets.zero,
                            elevation: 2,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                              side: BorderSide(
                                color: feature.color.withOpacity(0.20),
                                width: 1,
                              ),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (_) => feature.page,
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 38,
                                      width: 38,
                                      decoration: BoxDecoration(
                                        color: feature.color.withOpacity(0.12),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        feature.icon,
                                        size: 21,
                                        color: feature.color,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      feature.title,
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: feature.color,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      feature.subtitle,
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 10,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _FeatureItem {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final Widget page;

  const _FeatureItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.page,
  });
}
