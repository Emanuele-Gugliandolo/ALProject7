codeunit 50400 "DYF MyCodeunit"
{

    /*Export CSV*/
    procedure exportcsv()
    var
        tempblob: Codeunit "Temp Blob";
        ins: InStream;
        outs: OutStream;
        filename: Text;
        textbuilder: TextBuilder;
        TestTable: Record "DYF TestTable";

    begin
        filename := 'Testfile_' + UserId + '_' + Format(CurrentDateTime) + '.csv';
        textbuilder.AppendLine('No.' + ';' + 'Name' + ';' + 'Surname' + ';' + 'Data of Bith' + ';' + 'Fiscal Code.' + ';;');
        if TestTable.FindSet() then
            repeat
                textbuilder.AppendLine(Format(TestTable."No.") + ';' + Format(TestTable.Name) + ';' + Format(TestTable.Surname) + ';' + Format(TestTable."Date of birth") + ';' + Format(TestTable."Fiscal Code.") + ';;');

            until TestTable.Next() = 0;
        tempblob.CreateOutStream(outs);
        outs.Write(textbuilder.ToText());
        tempblob.CreateInStream(ins);
        DownloadFromStream(ins, '', '', '', filename);
    end;

    /******* Import CSV ********/

    procedure ReadCSVData()
    var
        FileManagement: Codeunit "File Management";
        InStream: InStream;
        FromFile: Text[100];

    begin
        UploadIntoStream(UploadMsg, '', '', FromFile, Instream);
        if FromFile <> '' then begin
            FileName := FileManagement.GetFileName(FromFile);
        end else
            Error(NoFileMsg);
        TempCSVBuffer.Reset();
        TempCSVBuffer.DeleteAll();
        TempCSVBuffer.LoadDataFromStream(InStream, ';');
        TempCSVBuffer.GetNumberOfLines();
    end;

    procedure GetValueAtCell1(RowNo: Integer; ColNo: Integer): Text
    begin
        TempCSVBuffer.Reset();
        if TempCSVBuffer.Get(RowNo, ColNo) then
            exit(TempCSVBuffer.Value)
        else
            exit('');
    end;

    procedure ImportCSVData()
    var
        TestTableL: Record "DYF TestTable";
        RowNo: Integer;
        ColNo: Integer;
        LineNo: Integer;
        MaxRow: Integer;

    begin
        RowNo := 0;
        ColNo := 0;
        LineNo := 0;
        MaxRow := 0;
        TestTableL.Reset();
        TempCSVBuffer.Reset();
        if TempCSVBuffer.FindLast() then
            MaxRow := TempCSVBuffer."Line No.";
        for RowNo := 2 to MaxRow do begin
            TestTableL.Init();
            Evaluate(TestTableL."No.", GetValueAtCell1(RowNo, 1));
            Evaluate(TestTableL.Name, GetValueAtCell1(RowNo, 2));
            Evaluate(TestTableL.Surname, GetValueAtCell1(RowNo, 3));
            Evaluate(TestTableL."Date of birth", GetValueAtCell1(RowNo, 4));
            Evaluate(TestTableL."Fiscal Code.", GetValueAtCell1(RowNo, 5));
            TestTableL.Insert();
        end;
        Message(ImportSuccess);
    end;

    /* Import Excel*/

    procedure ReadExcelData()
    var
        FileManagement: Codeunit "File Management";
        InStream: InStream;
        FromFile: Text[100];

    begin
        UploadIntoStream(UploadMsg, '', '', FromFile, Instream);
        if FromFile <> '' then begin
            FileName := FileManagement.GetFileName(FromFile);
            SheetName := TempExcelBuffer.SelectSheetsNameStream(InStream);
        end else
            Error(NoFileMsg);
        TempExcelBuffer.Reset();
        TempExcelBuffer.DeleteAll();
        TempExcelBuffer.OpenBookStream(InStream, SheetName);
        TempExcelBuffer.ReadSheet();
    end;

    procedure GetValueAtCell2(RowNo: Integer; ColNo: Integer): Text
    begin
        TempExcelBuffer.Reset();
        if TempExcelBuffer.Get(RowNo, ColNo) then
            exit(TempExcelBuffer."Cell Value as Text")
        else
            exit('');
    end;

    procedure ImportExcelData()
    var
        TestTableL: Record "DYF TestTable";
        RowNo: Integer;
        ColNo: Integer;
        LineNo: Integer;
        MaxRow: Integer;

    begin
        RowNo := 0;
        ColNo := 0;
        LineNo := 0;
        MaxRow := 0;
        TestTableL.Reset();
        TempExcelBuffer.Reset();
        if TempExcelBuffer.FindLast() then
            MaxRow := TempExcelBuffer."Row No.";
        for RowNo := 2 to MaxRow do begin
            TestTableL.Init();
            Evaluate(TestTableL."No.", GetValueAtCell2(RowNo, 1));
            Evaluate(TestTableL.Name, GetValueAtCell2(RowNo, 2));
            Evaluate(TestTableL.Surname, GetValueAtCell2(RowNo, 3));
            Evaluate(TestTableL."Date of birth", GetValueAtCell2(RowNo, 4));
            Evaluate(TestTableL."Fiscal Code.", GetValueAtCell2(RowNo, 5));
            TestTableL.Insert();
        end;
        Message(ImportSuccess);
    end;

    /* Export Excel*/
    procedure ExportExcel()
    var
        ExcelBufferL: Record "Excel Buffer" temporary;
        CustomerLedgerEntries: Label 'Customer Ledger Entries';
        ExcelFileName: Label 'CustomerLedgerEntries_%1_%2';

    begin
        ExcelBufferL.Reset();
        ExcelBufferL.DeleteAll();
        ExcelBufferL.NewRow();
        ExcelBufferL.AddColumn(TestTableL.FieldCaption("No."), false, '', false, false, false, '', ExcelBufferL."Cell Type"::Text);
        ExcelBufferL.AddColumn(TestTableL.FieldCaption("Name"), false, '', false, false, false, '', ExcelBufferL."Cell Type"::Text);
        ExcelBufferL.AddColumn(TestTableL.FieldCaption("Surname"), false, '', false, false, false, '', ExcelBufferL."Cell Type"::Text);
        ExcelBufferL.AddColumn(TestTableL.FieldCaption("Date of birth"), false, '', false, false, false, '', ExcelBufferL."Cell Type"::Date);
        ExcelBufferL.AddColumn(TestTableL.FieldCaption("Fiscal Code."), false, '', false, false, false, '', ExcelBufferL."Cell Type"::Text);
        if TestTableL.FindSet() then
            repeat
                ExcelBufferL.NewRow();
                ExcelBufferL.AddColumn(TestTableL."No.", false, '', false, false, false, '', ExcelBufferL."Cell Type"::Text);
                ExcelBufferL.AddColumn(TestTableL.Name, false, '', false, false, false, '', ExcelBufferL."Cell Type"::Text);
                ExcelBufferL.AddColumn(TestTableL.Surname, false, '', false, false, false, '', ExcelBufferL."Cell Type"::Text);
                ExcelBufferL.AddColumn(TestTableL."Date of birth", false, '', false, false, false, '', ExcelBufferL."Cell Type"::Date);
                ExcelBufferL.AddColumn(TestTableL."Fiscal Code.", false, '', false, false, false, '', ExcelBufferL."Cell Type"::Text);
            until TestTableL.next() = 0;
        ExcelBufferL.CreateNewBook(CustomerLedgerEntries);
        ExcelBufferL.WriteSheet(CustomerLedgerEntries, CompanyName, UserId);
        ExcelBufferL.CloseBook();
        ExcelBufferL.SetFriendlyFilename(StrSubstNo(ExcelFileName, CurrentDateTime, UserId));
        ExcelBufferL.OpenExcel();
    end;

    procedure ExportJSON()
    var
        TestTable: Record "DYF TestTable";
        exctablejson: JsonObject;
        exctablearray: JsonArray;
        tempblob: Codeunit "Temp Blob";
        ins: InStream;
        outs: OutStream;
        exportfilename: Text;


    begin

        //TestTable.SetRange("No.");
        exctablejson.Add(TestTable.FieldCaption("No."), TestTable."No.");
        exctablejson.Add(TestTable.FieldCaption(Name), TestTable.Name);
        exctablejson.Add(TestTable.FieldCaption(Surname), TestTable.Surname);
        exctablejson.Add(TestTable.FieldCaption("Date of birth"), TestTable."Date of birth");
        exctablejson.Add(TestTable.FieldCaption("Fiscal Code."), TestTable."Fiscal Code.");
        exctablearray.add(exctablejson);


        if TestTable.FindSet() then
            repeat
                Clear(exctablejson);
                exctablejson.Add(TestTable.FieldCaption("No."), TestTable."No.");
                exctablejson.Add(TestTable.FieldCaption(Name), TestTable.Name);
                exctablejson.Add(TestTable.FieldCaption(Surname), TestTable.Surname);
                exctablejson.Add(TestTable.FieldCaption("Date of birth"), TestTable."Date of birth");
                exctablejson.Add(TestTable.FieldCaption("Fiscal Code."), TestTable."Fiscal Code.");
                exctablearray.add(exctablejson);
            until TestTable.Next() = 0;
        TestTable.Reset();
        TestTable.FindSet();
        tempblob.CreateOutStream(outs);
        if exctablearray.WriteTo(outs) then begin
            exportfilename := 'exctable.json';
            tempblob.CreateInStream(ins);
            DownloadFromStream(ins, '', '', '', exportfilename);
        end;
    end;

    procedure XMLExport()
    var
        tempblob: Codeunit "Temp Blob";
        exportfilename: Text;
        ins: InStream;
        outs: OutStream;
        xmlElem2: XmlElement;
        xmlElem3: XmlElement;
        xmlElem4: XmlElement;
        xmlElem5: XmlElement;
        xmlElem6: XmlElement;
        xmlElem7: XmlElement;

        xmlElem: XmlElement;
        XmlDoc: XmlDocument;
        XmlDec: XmlDeclaration;
        XmlResult: Text;
    begin
        //Create the doc
        xmlDoc := xmlDocument.Create();

        //Add the declaration
        xmlDec := xmlDeclaration.Create('1.0', 'utf-8', 'yes');
        xmlDoc.SetDeclaration(xmlDec);

        //Create root node
        xmlElem := xmlElement.Create('exportxml');

        //Add some attributes to the root node
        //xmlElem.SetAttribute('attribute1', 'value1');
        //xmlElem.SetAttribute('attribute2', 'value2');

        //Add DataItems

        repeat
            //Add a couple of DataItem
            xmlElem2 := XmlElement.Create('items');

            //Add text to the dataitem
            xmlElem3 := XmlElement.Create('No.');
            xmlElem4 := XmlElement.Create('Name');
            xmlElem5 := XmlElement.Create('Surname');
            xmlElem6 := XmlElement.Create('Date_of_birth');
            xmlElem7 := xmlElement.Create('Fiscal_Code.');

            xmlElem3.Add(XmlText.Create(TestTableL."No."));
            xmlElem4.Add(XmlText.Create(TestTableL.Name));
            xmlElem5.Add(XmlText.Create(TestTableL.Surname));
            xmlElem6.Add(XmlText.Create(Format(TestTableL."Date of birth")));
            xmlElem7.Add(XmlText.Create(TestTableL."Fiscal Code."));

            //Write elements to the doc
            xmlElem2.Add(xmlElem3);
            xmlElem2.add(xmlElem4);
            xmlElem2.add(xmlElem5);
            xmlElem2.add(xmlElem6);
            xmlElem2.add(xmlElem7);

            xmlElem.Add(xmlElem2);
        until TestTableL.next() = 0;
        XmlDoc.Add(xmlElem);

        tempblob.CreateOutStream(outs);
        if XmlDoc.WriteTo(outs) then begin
            exportfilename := 'TestTableL.xml';
            tempblob.CreateInStream(ins);
            DownloadFromStream(ins, '', '', '', exportfilename);
        end;
    end;

    var
        FileName: Text[100];
        TempCSVBuffer: Record "CSV Buffer" temporary;
        UploadMsg: Label 'Please choose the File!';
        NoFileMsg: Label 'No File Found!';
        ImportSuccess: Label 'Imported Successfully!';

        //FileName: Text[100];
        SheetName: Text[100];
        TempExcelBuffer: Record "Excel Buffer" temporary;
        //UploadMsg: Label 'Please choose the Excel File!';
        //NoFileMsg: Label 'No Excel File Found!';
        // BachIsBlankMsg: Label 'Transaction Name is Blank!';
        //ImportSuccess: Label 'Excel Imported Successfully!';
        TestTableL: Record "DYF TestTable";
}