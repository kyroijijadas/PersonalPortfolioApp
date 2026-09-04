import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; 


void main() {
  runApp(const PersonalPortfolioApp());
}

class PersonalPortfolioApp extends StatelessWidget {
  const PersonalPortfolioApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Portfolio',
      theme: ThemeData.dark().copyWith(
        // EXACT BACKGROUND COLOR SAMPLED FROM IMAGE (#111615)
        scaffoldBackgroundColor: const Color(0xFF111615), 
        // Sets a clean base font (Inter) for normal text
        textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
      ),
      home: const PortfolioScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({Key? key}) : super(key: key);

  // Examination data variables
  final String studentName = "Joshuel Dinong"; 
  final String professorName = "Prof. Albert Q. Alforja";
  final String examinationDate = "September 4, 2026";

  // List of technical skills
  final List<String> skills = const [
    'Java',
    'Dart',
    'Kotlin',
    'JavaScript',
    'React',
    'PHP',
    'SQL',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row with Icon & Profile Chip
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 const Icon(Icons.code, size: 32, color: Colors.white),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white24),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Portfolio',
                      style: GoogleFonts.orbitron(fontSize: 13, color: Colors.white70),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Circular Profile Image with Floating Overlay Tag
              Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(120),
                      child: Image.asset(
                        'assets/profile.png',
                        height: 220,
                        width: 220,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      right: 8,
                      child: Text(
                        'Developer',
                        style: GoogleFonts.orbitron(
                          color: const Color(0xFF42C89A), 
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Student Name Title
              Center(
                child: Text(
                  studentName,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.orbitron(
                    fontSize: 36,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    height: 1,
                    letterSpacing: -1,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // "About Me" Heading
              Text(
                'About Me',
                style: GoogleFonts.orbitron(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),

              // Bio Description Text
              const Text(
                 "Driven by curiosity and hard work, I enjoy exploring new technologies, adapting to different workflows, and solving challenging programming logic.",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white60,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 20),

              // "Skills" Heading
              Text(
                'Skills & Technologies',
                style: GoogleFonts.orbitron(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),

              // Skill Chips Container
              Wrap(
                spacing: 8.0,
                runSpacing: 10.0,
                children: skills.map((skill) {
                  return _HoverSkillChip(skill: skill);
                }).toList(),
              ),
              const SizedBox(height: 32),

              // REQUIRED EXAM BUTTON: "Click Me" with GestureDetector & SnackBar Modals
              GestureDetector(
                onTap: () {
                  // Single Tap: Print examination date & show SnackBar modal
                  print("EXAM_LOG: Examination Date -> $examinationDate");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Exam Date: $examinationDate', style: GoogleFonts.orbitron(color: Colors.white)),
                      backgroundColor: const Color(0xFF17211F),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                onDoubleTap: () {
                  // Double Tap: Print professor's full name & show SnackBar modal
                  print("EXAM_LOG: Professor Name -> $professorName");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Professor: $professorName', style: GoogleFonts.orbitron(color: Colors.white)),
                      backgroundColor: const Color(0xFF17211F),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                onLongPress: () {
                  // Long Press: Print student's full name & show SnackBar modal
                  print("EXAM_LOG: Student Name -> ${studentName.replaceAll('\n', ' ')}");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Student: ${studentName.replaceAll('\n', ' ')}', style: GoogleFonts.orbitron(color: Colors.black)),
                      backgroundColor: const Color(0xFF42C89A),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF17211F), 
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: const Color(0xFF2A3533)),
                  ),
                  child: Center(
                    child: Text(
                      'Click Me',
                      style: GoogleFonts.orbitron(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _HoverSkillChip extends StatefulWidget {
  const _HoverSkillChip({required this.skill});

  final String skill;

  @override
  State<_HoverSkillChip> createState() => _HoverSkillChipState();
}

class _HoverSkillChipState extends State<_HoverSkillChip> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        transform: _isHovered
            ? (Matrix4.identity()..scale(1.05))
            : Matrix4.identity(),
        decoration: BoxDecoration(
          color: _isHovered
              ? const Color(0xFF20332F)
              : const Color(0xFF17211F),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _isHovered
                ? const Color(0xFF42C89A)
                : const Color(0xFF2A3533),
          ),
          boxShadow: _isHovered
              ? [
                  const BoxShadow(
                    color: Color(0x5542C89A),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ]
              : const [],
        ),
        child: Text(
          widget.skill,
          style: GoogleFonts.orbitron(
            fontSize: 12,
            color: const Color(0xFF42C89A),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}