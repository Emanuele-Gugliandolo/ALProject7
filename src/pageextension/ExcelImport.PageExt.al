pageextension 50400 "DYF Excel Import" extends "DYF TestPageList"
{
    actions
    {
        addlast(Navigation)
        {
            action("DYF ExcelImport")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Category4;
                Image = ImportExcel;
                Caption = 'Import Excel File to Business Central', Comment = 'ITA="Importare file Excel in Business Central"';

                trigger OnAction()
                begin
                    MyCodunit.ReadExcelData();
                    MyCodunit.ImportExcelData();
                end;
            }
        }
    }

    var
        MyCodunit: Codeunit "DYF MyCodeunit";

    // var
    //     BatchName: Code[10];
    //     FileName: Text[100];
    //     SheetName: Text[100];
    //     TempExcelBuffer: Record "Excel Buffer" temporary;
    //     UploadMsg: Label 'Please choose the Excel File!';
    //     NoFileMsg: Label 'No Excel File Found!';
    //     // BachIsBlankMsg: Label 'Transaction Name is Blank!';
    //     ExcelImportSuccess: Label 'Excel Imported Successfully!';

    // local procedure ReadExcelData()
    // var
    //     FileManagement: Codeunit "File Management";
    //     InStream: InStream;
    //     FromFile: Text[100];

    // begin
    //     UploadIntoStream(UploadMsg, '', '', FromFile, Instream);
    //     if FromFile <> '' then begin
    //         FileName := FileManagement.GetFileName(FromFile);
    //         SheetName := TempExcelBuffer.SelectSheetsNameStream(InStream);
    //     end else
    //         Error(NoFileMsg);
    //     TempExcelBuffer.Reset();
    //     TempExcelBuffer.DeleteAll();
    //     TempExcelBuffer.OpenBookStream(InStream, SheetName);
    //     TempExcelBuffer.ReadSheet();
    // end;

    // local procedure GetValueAtCell(RowNo: Integer; ColNo: Integer): Text
    // begin
    //     TempExcelBuffer.Reset();
    //     if TempExcelBuffer.Get(RowNo, ColNo) then
    //         exit(TempExcelBuffer."Cell Value as Text")
    //     else
    //         exit('');
    // end;

    // local procedure ImportExcelData()
    // var
    //     TestTableL: Record "DYF TestTable";
    //     RowNo: Integer;
    //     ColNo: Integer;
    //     LineNo: Integer;
    //     MaxRow: Integer;

    // begin
    //     RowNo := 0;
    //     ColNo := 0;
    //     LineNo := 0;
    //     MaxRow := 0;
    //     TestTableL.Reset();
    //     // if TestTableL.FindLast() then
    //     //     LineNo := TestTableL."Line No.";
    //     TempExcelBuffer.Reset();
    //     if TempExcelBuffer.FindLast() then
    //         MaxRow := TempExcelBuffer."Row No.";
    //     for RowNo := 2 to MaxRow do begin
    //         TestTableL.Init();
    //         Evaluate(TestTableL."No.", GetValueAtCell(RowNo, 1));
    //         Evaluate(TestTableL.Name, GetValueAtCell(RowNo, 2));
    //         Evaluate(TestTableL.Surname, GetValueAtCell(RowNo, 3));
    //         Evaluate(TestTableL."Date of birth", GetValueAtCell(RowNo, 4));
    //         Evaluate(TestTableL."Fiscal Code.", GetValueAtCell(RowNo, 5));
    //         TestTableL.Insert();
    //     end;
    //     Message(ExcelImportSuccess);
    // end;
}
