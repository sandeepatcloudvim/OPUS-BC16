pageextension 50000 ExtendSalesOrder extends "Sales Order"
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
        // Add changes to page actions here
        addafter("Pick Instruction")
        {
            action("Bill of Lading")
            {
                ApplicationArea = Warehouse;
                Caption = 'Bill of Lading';
                Image = Print;
                Promoted = true;
                PromotedCategory = Category11;
                ToolTip = 'Print a Bill of lading that shows which items to pick and ship for the sales order. If an item is assembled to order, then the report includes rows for the assembly components that must be picked. Use this report as a pick instruction to employees in charge of picking sales items or assembly components for the sales order.';

                trigger OnAction()
                begin
                    Clear(BillOfLadingReport);
                    CurrPage.SetSelectionFilter(SalsheaderRec);
                    BillOfLadingReport.SetTableView(SalsheaderRec);
                    BillOfLadingReport.RunModal();

                end;
            }

        }
    }

    var
        myInt: Integer;
        BillOfLadingReport: Report 50005;
        SalsheaderRec: Record "Sales Header";
}