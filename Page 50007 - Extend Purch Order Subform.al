pageextension 50007 ExtendPurchOrderSubform extends "Purchase Order Subform"
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