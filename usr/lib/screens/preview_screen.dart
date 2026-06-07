import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import '../models/resume_model.dart';
import '../services/pdf_service.dart';

class PreviewScreen extends StatelessWidget {
  final ResumeModel resume;

  const PreviewScreen({super.key, required this.resume});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Resume Preview"),
      ),
      body: PdfPreview(
        build: (format) => PdfService.generateResume(resume),
        canChangeOrientation: false,
        canChangePageFormat: false,
        canDebug: false,
      ),
    );
  }
}
