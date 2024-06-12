pageextension 50401 "DYF CSVImport" extends "DYF TestPageList"
{
    actions
    {
        addlast(Navigation)
        {
            action("DYF CSVImport")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Category4;
                Image = Import;
                Caption = 'Import CSV File to Business Central', Comment = 'ITA="Importare file CSV in Business Central"';

                trigger OnAction()
                begin
                    MyCodunit.ReadCSVData();
                    MyCodunit.ImportCSVData();
                end;
            }


        }
    }

    var
        MyCodunit: Codeunit "DYF MyCodeunit";

    // var
    //     //TransName: Code[10];
    //     FileName: Text[100];
    //     TempCSVBuffer: Record "CSV Buffer" temporary;
    //     UploadMsg: Label 'Please choose the CSV File!';
    //     NoFileMsg: Label 'No CSV File Found!';
    //     BachIsBlankMsg: Label 'Transaction Name is Blank!';
    //     CSVImportSuccess: Label 'CSV Imported Successfully!';

    // local procedure ReadCSVData()
    // var
    //     FileManagement: Codeunit "File Management";
    //     InStream: InStream;
    //     FromFile: Text[100];

    // begin
    //     UploadIntoStream(UploadMsg, '', '', FromFile, Instream);
    //     if FromFile <> '' then begin
    //         FileName := FileManagement.GetFileName(FromFile);
    //     end else
    //         Error(NoFileMsg);
    //     TempCSVBuffer.Reset();
    //     TempCSVBuffer.DeleteAll();
    //     TempCSVBuffer.LoadDataFromStream(InStream, ';');
    //     TempCSVBuffer.GetNumberOfLines();
    // end;

    // local procedure GetValueAtCell(RowNo: Integer; ColNo: Integer): Text
    // begin
    //     TempCSVBuffer.Reset();
    //     if TempCSVBuffer.Get(RowNo, ColNo) then
    //         exit(TempCSVBuffer.Value)
    //     else
    //         exit('');
    // end;

    // local procedure ImportCSVData()
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
    //     TempCSVBuffer.Reset();
    //     if TempCSVBuffer.FindLast() then
    //         MaxRow := TempCSVBuffer."Line No.";     //"Row No."
    //     for RowNo := 2 to MaxRow do begin
    //         TestTableL.Init();
    //         Evaluate(TestTableL."No.", GetValueAtCell(RowNo, 1));
    //         Evaluate(TestTableL.Name, GetValueAtCell(RowNo, 2));
    //         Evaluate(TestTableL.Surname, GetValueAtCell(RowNo, 3));
    //         Evaluate(TestTableL."Date of birth", GetValueAtCell(RowNo, 4));
    //         Evaluate(TestTableL."Fiscal Code.", GetValueAtCell(RowNo, 5));
    //         TestTableL.Insert();
    //     end;
    //     Message(CSVImportSuccess);
    // end;
}
