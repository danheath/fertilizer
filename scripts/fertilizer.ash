script "fertilizer.ash"

void main(int fertilizer) {
    if ( fertilizer <= ($item[Poke-Gro fertilizer].item_amount()))
    {
        // Check to see if we are on Thanksgarden.  Harvest and switch.
        string gstatus = cli_execute("garden");
        // Ensure if we are starting with Thanksgarden we pick before we switch
        if (contains_text("cornucopias in it", gstatus))
        {
            cli_execute("garden pick");
            
        }
        else
        {
            print("Need to start with Thanksgarden");
            cli_execute("use packet of thanksgarden seeds");
        }
        while( fertilizer > 0 )
        {
            cli_execute("use packet of tall grass seeds");
            cli_execute("use Poke-Gro fertilizer");
            cli_execute("use packet of thanksgarden seeds");
            buffer test = visit_url("campground.php?action=garden");
            wait(1);
            cli_execute("garden pick");
            fertilizer -=1;
        }
    }
    else
    {
        abort("Number of fertilizers specified exceeds total requested.  You have " + $item[Poke-Gro fertilizer].item_amount() + " of fertilizer");
    }
    print("You now have " + $item[Cornucopia].item_amount() + " cornucopia");
}
