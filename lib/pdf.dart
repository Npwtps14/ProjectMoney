import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import 'mobile.dart' if (dart.library.html) 'web.dart';

class PdfPage extends StatefulWidget {
  final name;
  final email;
  final phone;
  final saraly;
  final lastSaraly;
  final income;
  final pays;
  final total;
  const PdfPage(
      {this.name,
      this.email,
      this.phone,
      this.saraly,
      this.income,
      this.lastSaraly,
      this.pays,
      this.total});

  @override
  PdfPageState createState() => new PdfPageState();
}

class PdfPageState extends State<PdfPage> {
  // var dname = name;

  // static var name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Create PDF'),
          onPressed: _createPDF,
        ),
      ),
    );
  }

  Future<void> _createPDF() async {
    PdfDocument document = PdfDocument();
    final titlePage = document.pages.add();
    var a = int.parse(widget.income);
    var b = int.parse(widget.pays);
    // var a = 10;
    // var b = 5;

    var y = int.parse(widget.saraly);
    var z = int.parse(widget.lastSaraly);
    var x;
    if (z < y) {
      x = "Your saraly not balance";
    } else {
      x = "Your salary balane";
    }

    titlePage.graphics.drawString(
        'Name\n${widget.name}', PdfStandardFont(PdfFontFamily.helvetica, 20),
        bounds: Rect.fromLTWH(0, 50, titlePage.getClientSize().width,
            titlePage.getClientSize().height),
        format: PdfStringFormat(alignment: PdfTextAlignment.left));

    titlePage.graphics.drawString(
        'Email\n${widget.email}', PdfStandardFont(PdfFontFamily.helvetica, 20),
        bounds: Rect.fromLTWH(0, 120, titlePage.getClientSize().width,
            titlePage.getClientSize().height),
        format: PdfStringFormat(alignment: PdfTextAlignment.left));

    titlePage.graphics.drawString(
        'Phone\n${widget.phone}', PdfStandardFont(PdfFontFamily.helvetica, 20),
        bounds: Rect.fromLTWH(0, 190, titlePage.getClientSize().width,
            titlePage.getClientSize().height),
        format: PdfStringFormat(alignment: PdfTextAlignment.left));

    titlePage.graphics.drawString('FullSaraly\n${widget.saraly}',
        PdfStandardFont(PdfFontFamily.helvetica, 20),
        bounds: Rect.fromLTWH(0, 260, titlePage.getClientSize().width,
            titlePage.getClientSize().height),
        format: PdfStringFormat(alignment: PdfTextAlignment.left));

    titlePage.graphics.drawString('Last Saraly\n${widget.lastSaraly}',
        PdfStandardFont(PdfFontFamily.helvetica, 20),
        bounds: Rect.fromLTWH(0, 330, titlePage.getClientSize().width,
            titlePage.getClientSize().height),
        format: PdfStringFormat(alignment: PdfTextAlignment.left));

    titlePage.graphics.drawString(
        'Income\n${a}', PdfStandardFont(PdfFontFamily.helvetica, 20),
        brush: PdfBrushes.green,
        bounds: Rect.fromLTWH(0, 400, titlePage.getClientSize().width,
            titlePage.getClientSize().height),
        format: PdfStringFormat(alignment: PdfTextAlignment.left));

    titlePage.graphics.drawString(
        'Pays\n${b}', PdfStandardFont(PdfFontFamily.helvetica, 20),
        brush: PdfBrushes.red,
        bounds: Rect.fromLTWH(0, 470, titlePage.getClientSize().width,
            titlePage.getClientSize().height),
        format: PdfStringFormat(alignment: PdfTextAlignment.left));

    titlePage.graphics.drawString(
        'Total\n ${a - b}', PdfStandardFont(PdfFontFamily.helvetica, 20),
        bounds: Rect.fromLTWH(0, 540, titlePage.getClientSize().width,
            titlePage.getClientSize().height),
        format: PdfStringFormat(alignment: PdfTextAlignment.left));

    titlePage.graphics.drawString(
        'Saraly balance\n ${x}', PdfStandardFont(PdfFontFamily.helvetica, 20),
        bounds: Rect.fromLTWH(0, 610, titlePage.getClientSize().width,
            titlePage.getClientSize().height),
        format: PdfStringFormat(alignment: PdfTextAlignment.left));

    // PdfGrid grid = PdfGrid();
    // grid.style = PdfGridStyle(
    //     font: PdfStandardFont(PdfFontFamily.helvetica, 30),
    //     cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 2));

    // grid.columns.add(count: 3);
    // grid.headers.add(1);

    // PdfGridRow header = grid.headers[0];
    // header.cells[0].value = 'No.';
    // header.cells[1].value = "name";
    // header.cells[2].value = 'Class';

    // PdfGridRow row = grid.rows.add();
    // row.cells[0].value = '1';
    // row.cells[1].value = "${widget.name}";
    // row.cells[2].value = '6';

    // row = grid.rows.add();
    // row.cells[0].value = '2';
    // row.cells[1].value = 'John';
    // row.cells[2].value = '9';

    // row = grid.rows.add();
    // row.cells[0].value = '3';
    // row.cells[1].value = 'Tony';
    // row.cells[2].value = '8';

    // grid.draw(
    //     page: document.pages.add(), bounds: const Rect.fromLTWH(0, 0, 0, 0));

    List<int> bytes = document.save();
    document.dispose();

    saveAndLaunchFile(bytes, 'Output.pdf');
  }
}

Future<Uint8List> _readImageData(String name) async {
  final data = await rootBundle.load('images/$name');
  return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
}
