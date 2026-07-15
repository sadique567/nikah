import 'package:flutter/material.dart';

///  Baseic Details Card  A collapsible card used to group a set of related details
/// (Religious Details, Education & Career, Family Details, etc.)
class DetailSectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isExpanded;
  final VoidCallback onToggle;
  final List<Widget> children;

  const DetailSectionCard({
    super.key,
    required this.title,
    required this.icon,
    required this.isExpanded,
    required this.onToggle,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    Color secondaryColor = Theme.of(context).secondaryHeaderColor;
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 1,
            offset: const Offset(-1, 1),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 1,
            offset: const Offset(1, -1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: onToggle,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: secondaryColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(icon, color: secondaryColor, size: 20),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        // color: Color(0xFF1C1C1E),
                      ),
                    ),
                  ),
                  Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    // color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
          if (isExpanded)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 14),
              child: Column(children: children),
            ),
        ],
      ),
    );
  }
}

/// A single "Label : Value" row used inside a [DetailSectionCard].
class DetailRow extends StatelessWidget {
  final String label;
  final String value;
  final IconData? icon;

  const DetailRow({
    super.key,
    required this.label,
    required this.value,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final displayValue = value.trim().isEmpty ? '—' : value;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 16, color: Colors.red),
            const SizedBox(width: 8),
          ],
          Expanded(flex: 4, child: Text(label, style: TextStyle(fontSize: 14))),
          Expanded(
            flex: 5,
            child: Text(
              displayValue,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                // color: Color(0xFF1C1C1E),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Small rounded pill used for quick facts under the profile header
/// (age, height, city, sect etc.)
class QuickFactChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const QuickFactChip({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F6F5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: Theme.of(context).secondaryHeaderColor),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

/// Read-only circular profile photo. No picker / upload logic —
/// purely for displaying the existing photo (or an initials fallback).
class ReadOnlyProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final String fullName;
  final double radius;
  // final bool isVerified;

  const ReadOnlyProfileAvatar({
    super.key,
    required this.imageUrl,
    required this.fullName,
    this.radius = 55,
  });

  // if user has no image the Show User name character
  String get _initials {
    final parts = fullName.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty || parts.first.isEmpty) return '?';
    final first = parts[0][0];
    final second = parts.length > 1 ? parts[1][0] : '';
    return (first + second).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFF0E7C66), width: 2.5),
          ),
          child: CircleAvatar(
            radius: radius,
            backgroundColor: const Color(0xFF0E7C66).withOpacity(0.15),
            backgroundImage: imageUrl.trim().isNotEmpty
                ? NetworkImage(imageUrl)
                : null,
            child: imageUrl.trim().isEmpty
                ? Text(
                    _initials,
                    style: TextStyle(
                      fontSize: radius * 0.55,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF0E7C66),
                    ),
                  )
                : null,
          ),
        ),
        // if (isVerified)
        //   Positioned(
        //     top: -10,
        //     // bottom: 100,
        //     // right: -250,
        //     left: 100,
        //     child: Container(
        //       padding: const EdgeInsets.all(4),
        //       decoration: const BoxDecoration(
        //         color: Color(0xFF0E7C66),
        //         shape: BoxShape.circle,
        //       ),
        //       child: const Icon(Icons.verified, size: 16, color: Colors.white),
        //     ),
        //   ),
      ],
    );
  }
}
