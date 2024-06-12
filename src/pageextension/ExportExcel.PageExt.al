pageextension 50402 "DYF ExportExcel" extends "DYF TestPageList"
{
    actions
    {
        addlast(Navigation)
        {
            action("DYF ExportExcel")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Category4;
                Image = ExportToExcel;
                Caption = 'Export Data in to Excel File', Comment = 'ITA="Esportare dati in file Excel"';
                trigger OnAction()
                var

                begin
                    MyCodunit.ExportExcel();
                end;
            }
        }
    }

    var
        MyCodunit: Codeunit "DYF MyCodeunit";
    // var
    //     TestTableL: Record "DYF TestTable";

    // local procedure ExportExcel()
    // var
    //     ExcelBufferL: Record "Excel Buffer" temporary;
    //     CustomerLedgerEntries: Label 'Customer Ledger Entries';
    //     ExcelFileName: Label 'CustomerLedgerEntries_%1_%2';

    // begin
    //     ExcelBufferL.Reset();
    //     ExcelBufferL.DeleteAll();
    //     ExcelBufferL.NewRow();
    //     ExcelBufferL.AddColumn(TestTableL.FieldCaption("No."), false, '', false, false, false, '', ExcelBufferL."Cell Type"::Text);
    //     ExcelBufferL.AddColumn(TestTableL.FieldCaption("Name"), false, '', false, false, false, '', ExcelBufferL."Cell Type"::Text);
    //     ExcelBufferL.AddColumn(TestTableL.FieldCaption("Surname"), false, '', false, false, false, '', ExcelBufferL."Cell Type"::Text);
    //     ExcelBufferL.AddColumn(TestTableL.FieldCaption("Date of birth"), false, '', false, false, false, '', ExcelBufferL."Cell Type"::Date);
    //     ExcelBufferL.AddColumn(TestTableL.FieldCaption("Fiscal Code."), false, '', false, false, false, '', ExcelBufferL."Cell Type"::Text);
    //     if TestTableL.FindSet() then
    //         repeat
    //             ExcelBufferL.NewRow();
    //             ExcelBufferL.AddColumn(TestTableL."No.", false, '', false, false, false, '', ExcelBufferL."Cell Type"::Text);
    //             ExcelBufferL.AddColumn(TestTableL.Name, false, '', false, false, false, '', ExcelBufferL."Cell Type"::Text);
    //             ExcelBufferL.AddColumn(TestTableL.Surname, false, '', false, false, false, '', ExcelBufferL."Cell Type"::Text);
    //             ExcelBufferL.AddColumn(TestTableL."Date of birth", false, '', false, false, false, '', ExcelBufferL."Cell Type"::Date);
    //             ExcelBufferL.AddColumn(TestTableL."Fiscal Code.", false, '', false, false, false, '', ExcelBufferL."Cell Type"::Text);
    //         until TestTableL.next() = 0;
    //     ExcelBufferL.CreateNewBook(CustomerLedgerEntries);
    //     ExcelBufferL.WriteSheet(CustomerLedgerEntries, CompanyName, UserId);
    //     ExcelBufferL.CloseBook();
    //     ExcelBufferL.SetFriendlyFilename(StrSubstNo(ExcelFileName, CurrentDateTime, UserId));
    //     ExcelBufferL.OpenExcel();
    // end;
}
