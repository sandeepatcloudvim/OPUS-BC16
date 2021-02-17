pageextension 50005 ExtendSalesOrderSubform extends "Sales Order Subform"
{
    layout
    {
        addafter("Description")
        {
            field("Customer Text"; "Customer Text")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}