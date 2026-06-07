import 'dart:typed_data';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../models/resume_model.dart';
import 'package:pdf/pdf.dart';

class PdfService {
  static Future<Uint8List> generateResumePdf(ResumeModel data, String templateName) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          if (templateName == 'Classic') {
            return buildClassicTemplate(data);
          } else if (templateName == 'Modern') {
            return buildModernTemplate(data);
          } else {
            return buildClassicTemplate(data);
          }
        },
      ),
    );

    return pdf.save();
  }

  static pw.Widget buildClassicTemplate(ResumeModel data) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          data.name,
          style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
        ),
        pw.SizedBox(height: 10),
        pw.Text('Email: ${data.email} | Phone: ${data.phone}'),
        pw.SizedBox(height: 20),
        pw.Text('Professional Summary', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
        pw.Divider(),
        pw.Text(data.summary),
      ],
    );
  }

  static pw.Widget buildModernTemplate(ResumeModel data) {
    return pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Expanded(
          flex: 1,
          child: pw.Container(
            color: PdfColors.grey200,
            padding: const pw.EdgeInsets.all(16),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text('Contact', style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold)),
                pw.SizedBox(height: 10),
                pw.Text(data.email),
                pw.Text(data.phone),
              ],
            ),
          ),
        ),
        pw.Expanded(
          flex: 2,
          child: pw.Container(
            padding: const pw.EdgeInsets.all(16),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  data.name,
                  style: pw.TextStyle(fontSize: 28, fontWeight: pw.FontWeight.bold),
                ),
                pw.SizedBox(height: 20),
                pw.Text('Summary', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
                pw.Divider(),
                pw.Text(data.summary),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
