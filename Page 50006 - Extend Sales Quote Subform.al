pageextension 50006 ExtendSalesQuoteSubform extends "Sales Quote Subform"
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