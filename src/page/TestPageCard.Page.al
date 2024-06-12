page 50400 "DYF TestPageCard"
{
    ApplicationArea = All;
    Caption = 'TestPage';
    PageType = Card;
    SourceTable = "DYF TestTable";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
                field(Surname; Rec.Surname)
                {
                    ToolTip = 'Specifies the value of the Surname field.', Comment = '%';
                }
                field("Date of birth"; Rec."Date of birth")
                {
                    ToolTip = 'Specifies the value of the Date of birth field.', Comment = '%';
                }
                field("Fiscal Code."; Rec."Fiscal Code.")
                {
                    ToolTip = 'Specifies the value of the Fiscal Code. field.', Comment = '%';
                }
            }
        }
    }
}
