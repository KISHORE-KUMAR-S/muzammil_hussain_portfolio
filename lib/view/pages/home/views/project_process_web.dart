import 'package:auto_size_text/auto_size_text.dart';
import 'package:entry/entry.dart';
import 'package:flutter/material.dart';

import '../../../../config/constants.dart';
import '../../../../extensions/context_ext.dart';
import '../../../widgets/overlapping_text.dart';
import '../../../widgets/section_title.dart';

class ProjectProcessView extends StatelessWidget {
  const ProjectProcessView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          SectionTitle(
            backgroundText: "PROCESS",
            foreGroundText: "PROJECT PROCESS",
            subTitle: "LET'S TALK ABOUT YOUR PROJECT",
          ),
          SizedBox(height: 200),
          _ProcessCard(
            number: "01",
            title: "Counselling & Analysis",
            description:
                "In our session, my approach revolves around attentive listening, comprehensive questioning, and a dedicated effort to acquire an in-depth understanding of the scope and requirements for your solution.",
          ),
          _ProcessCard(
            isReversed: true,
            number: "02",
            title: "User interface design",
            description:
                "Above all, the visual aspect of your product takes center stage for users. It must not only be aesthetically pleasing but also embrace simplicity, functionality, and interactivity. The key is to streamline elements, ensuring an enjoyable user experience while maintaining visual excellence.",
          ),
          _ProcessCard(
            number: "03",
            title: "Development",
            description:
                "I specialize in Flutter, the optimal choice for building elegant looking mobile applications. I expedite project completion. My commitment includes optimizing mobile apps performance by following up to date coding standards, prioritizing speed, security, and reliability.",
          ),
          _ProcessCard(
            number: "04",
            title: "Delivery & Launch!",
            description:
                "Upon project completion, my commitment is to provide deliverables that not only meet your high-quality standards but also undergo continuous and thorough monitoring. This approach ensures that the final products align with your expectations and adhere to best practices.",
            isReversed: true,
          ),
        ],
      ),
    );
  }
}

class _ProcessCard extends StatelessWidget {
  const _ProcessCard({
    this.isReversed = false,
    required this.number,
    required this.title,
    required this.description,
  });
  final bool isReversed;
  final String number;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final children = context.isMobile
        ? [
            Entry.opacity(
              duration: Constants.smallDelay,
              // delay: Constants.smallDelay,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Entry.opacity(
                    duration: Constants.smallDelay,
                    delay: Constants.smallDelay,
                    child: Transform.scale(
                      scale: 0.8,
                      child: Container(
                        alignment: Alignment.center,
                        child: OverlappingText(
                          text: number,
                          offset: Offset(20, 10),
                        ),
                      ),
                    ),
                  ),
                  AutoSizeText(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(fontSize: 38),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ),
                  AutoSizeText(
                    description,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(height: 1.6),
                    maxLines: 5,
                    textAlign: TextAlign.center,
                  ),
                  Divider(
                    color: Colors.white.withOpacity(0.15),
                    height: 100,
                  ),
                ],
              ),
            ),
          ]
        : [
            Expanded(
              flex: 2,
              child: Entry.opacity(
                duration: Constants.smallDelay,
                delay: Constants.smallDelay,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(height: 1.6, fontSize: 48),
                    ),
                    Text(
                      description,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(height: 1.6),
                    ),
                    Divider(
                      color: Colors.white.withOpacity(0.15),
                      height: 200,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Entry.opacity(
                duration: Constants.smallDelay,
                delay: Constants.smallDelay,
                child: Container(
                  height: 140,
                  alignment:
                      isReversed ? Alignment.centerLeft : Alignment.centerRight,
                  child: OverlappingText(
                    text: number,
                    offset: Offset(20, 10),
                  ),
                ),
              ),
            )
          ];
    return Entry.opacity(
      duration: Constants.smallDelay,
      child: Container(
        constraints: BoxConstraints(maxWidth: 1600),
        padding: EdgeInsets.symmetric(horizontal: context.isMobile ? 20 : 100),
        child: context.isMobile
            ? LayoutBuilder(builder: (context, constraints) {
                return Container(
                  constraints: constraints,
                  alignment: Alignment.center,
                  child: Column(
                    children: children,
                  ),
                );
              })
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: isReversed ? children.reversed.toList() : children,
              ),
      ),
    );
  }
}
