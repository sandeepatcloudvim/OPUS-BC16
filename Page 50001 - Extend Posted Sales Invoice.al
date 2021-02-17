pageextension 50001 ExtendPostedSalesInv extends "Posted Sales Invoice"
{
    layout
    {
        addafter("External Document No.")
        {
            field("Freight on Board"; "Freight on Board")
            {
                ApplicationArea = All;
            }
            field(Project; Project)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        addafter(Print)
        {
            action("Bill of Lading")
            {
                ApplicationArea = Warehouse;
                Caption = 'Bill of Lading';
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;
                ToolTip = 'Print a Bill of lading that shows which items to pick and ship for the sales order. If an item is assembled to order, then the report includes rows for the assembly components that must be picked. Use this report as a pick instruction to employees in charge of picking sales items or assembly components for the sales order.';
                trigger OnAction()
                begin
                    CurrPage.SETSELECTIONFILTER(Rec);
                    REPORT.RUN(50006, TRUE, FALSE, Rec);
                    RESET;
                end;
            }

        }
    }

    var
        myInt: Integer;
        BillOfLadingReport: Report 50006;
        SalesInvRec: Record "Sales Invoice Header";
}