import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  static const Color headerBlue = Color(0xFF4A90E2);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> galleryItems = [
      {
        'title': 'Ragib Ali Portrait',
        'subtitle': 'Official portrait of philanthropist & founder Ragib Ali',
        'image': 'assets/ragib.jpg',
        'isAsset': 'true',
      },
      {
        'title': 'Leading University Campus',
        'subtitle': 'First private university established in Sylhet region',
        'isAsset': 'false',
        'category': 'Education',
      },
      {
        'title': 'Jalalabad Ragib-Rabeya Medical College',
        'subtitle': 'Healthcare facility serving hundreds of thousands',
        'isAsset': 'false',
        'category': 'Healthcare',
      },
      {
        'title': 'Tea Estate Initiatives',
        'subtitle': 'Pioneering agricultural and tea garden developments',
        'isAsset': 'false',
        'category': 'Industry',
      },
      {
        'title': 'Philanthropic Foundations',
        'subtitle': 'Charity trusts supporting underprivileged communities',
        'isAsset': 'false',
        'category': 'Philanthropy',
      },
      {
        'title': 'Student Scholarship Awards',
        'subtitle': 'Annual financial aid and recognition ceremonies',
        'isAsset': 'false',
        'category': 'Empowerment',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF7FAF8),
      appBar: AppBar(
        title: const Text('Photo & Media Gallery'),
        backgroundColor: headerBlue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Header banner card
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: Colors.blue.shade50,
            elevation: 0,
            child: const Padding(
              padding: EdgeInsets.all(14),
              child: Row(
                children: [
                  Icon(Icons.collections, color: headerBlue, size: 28),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Archived photos, foundation moments, and institutional milestones.',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Featured Item Card
          Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            elevation: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.grey.shade200,
                      child: Image.asset(
                        'assets/ragib.jpg',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: Colors.grey.shade200,
                          child: const Icon(Icons.broken_image, size: 60, color: Colors.grey),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 12,
                      right: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.65),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 14),
                            SizedBox(width: 4),
                            Text(
                              'Featured',
                              style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Founder & Chairman Ragib Ali',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Historic photograph of entrepreneur, education pioneer, and social benefactor.',
                        style: TextStyle(fontSize: 13, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          const Text(
            'Institutional Archives',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          // Grid of other items
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: galleryItems.length - 1,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              mainAxisExtent: 160,
            ),
            itemBuilder: (context, index) {
              final item = galleryItems[index + 1];
              return Card(
                elevation: 1.5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 80,
                      width: double.infinity,
                      color: headerBlue.withValues(alpha: 0.12),
                      alignment: Alignment.center,
                      child: Icon(
                        item['category'] == 'Education'
                            ? Icons.school
                            : item['category'] == 'Healthcare'
                                ? Icons.local_hospital
                                : item['category'] == 'Industry'
                                    ? Icons.landscape
                                    : item['category'] == 'Empowerment'
                                        ? Icons.military_tech
                                        : Icons.photo_library,
                        size: 36,
                        color: headerBlue,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['title']!,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            item['subtitle']!,
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.black54,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
