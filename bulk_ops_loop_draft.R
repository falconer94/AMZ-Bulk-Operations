#### Campaign ####
# Record Type = Campaign 
# Campaign = *enter into list
# Campaign Daily Budget = 50
# Campaign Start date = 
# Campaign Targeting Type = Manual
# Portfolio ID = Nutricost
# Ad Group = (campaign name) - Exact
# Campaign Status = Enabled
# Bidding Strategy = Off



for (c in 1:nrow(cmp)){
        blk <- add_row(blk, Record.Type = "Campaign",
                         Campaign = cmp[c, "Campaign.Name"],
                         Campaign.Targeting.Type = "Manual",
                         Portfolio.ID = "Nutricost",
                         Ad.Group = paste(cmp[c, "Campaign.Name"], " - Exact"),
                         Campaign.Status = "Enabled",
                         Bidding.strategy = "Off")
        





#### AdGroup 1 2 3 ####
# 1
# Record Type = AdGroup
# Campaign = campaign name
# Ad Group = campaign name " - Exact"
# Max bid = 2
# Ad Group Status = Enabled
        blk <- add_row(blk, 
                       Record.Type = "AdGroup",
                       Campaign = cmp[c, "Campaign.Name"],
                       Ad.Group = paste(cmp[c, "Campaign.Name"], " - Exact"),
                       Max.Bid = "2",
                       Ad.Group.Status = "Enabled"
                       )


# 2
# Record Type = AdGroup
# Campaign = campaign name
# Ad Group = campaign name " - Phrase"
# Max bid = 1.25
# Ad Group Status = Enabled
        blk <- add_row(blk, 
                       Record.Type = "AdGroup",
                       Campaign = cmp[c, "Campaign.Name"],
                       Ad.Group = paste(cmp[c, "Campaign.Name"], " - Phrase"),
                       Max.Bid = "1.25",
                       Ad.Group.Status = "Enabled"
        )
        
        
# 3
# Record Type = AdGroup
# Campaign = campaign name
# Ad Group = campaign name " - Broad"
# Max bid = 0.75
# Ad Group Status = Enabled
        blk <- add_row(blk, 
                       Record.Type = "AdGroup",
                       Campaign = cmp[c, "Campaign.Name"],
                       Ad.Group = paste(cmp[c, "Campaign.Name"], " - Broad"),
                       Max.Bid = "0.75",
                       Ad.Group.Status = "Enabled"
        )


#### Ad 1 2 3 (X2) ####
# 1
# Record Type = Ad
# Campaign = campaign name
# Ad Group = campaign name " - Exact"
# SKU = FBA/FBM SKU
# Status = Enabled
        blk <- add_row(blk, 
                       Record.Type = "Ad",
                       Campaign = cmp[c, "Campaign.Name"],
                       Ad.Group = paste(cmp[c, "Campaign.Name"], " - Exact"),
                       SKU = cmp[c, "FBA"],
                       Status = "Enabled"
        )
        
        blk <- add_row(blk, 
                       Record.Type = "Ad",
                       Campaign = cmp[c, "Campaign.Name"],
                       Ad.Group = paste(cmp[c, "Campaign.Name"], " - Exact"),
                       SKU = cmp[c, "FBM"],
                       Status = "Enabled"
        )

# 2
# Record Type = Ad
# Campaign = campaign name
# Ad Group = campaign name " - Phrase"
# SKU = FBA/FBM SKU
# Status = Enabled
        blk <- add_row(blk, 
                       Record.Type = "Ad",
                       Campaign = cmp[c, "Campaign.Name"],
                       Ad.Group = paste(cmp[c, "Campaign.Name"], " - Phrase"),
                       SKU = cmp[c, "FBA"],
                       Status = "Enabled"
        )
        
        blk <- add_row(blk, 
                       Record.Type = "Ad",
                       Campaign = cmp[c, "Campaign.Name"],
                       Ad.Group = paste(cmp[c, "Campaign.Name"], " - Phrase"),
                       SKU = cmp[c, "FBM"],
                       Status = "Enabled"
        )
        
# 3
# Record Type = Ad
# Campaign = campaign name
# Ad Group = campaign name " - Broad"
# SKU = FBA/FBM SKU
# Status = Enabled

        blk <- add_row(blk, 
                       Record.Type = "Ad",
                       Campaign = cmp[c, "Campaign.Name"],
                       Ad.Group = paste(cmp[c, "Campaign.Name"], " - Broad"),
                       SKU = cmp[c, "FBA"],
                       Status = "Enabled"
        )
        
        blk <- add_row(blk, 
                       Record.Type = "Ad",
                       Campaign = cmp[c, "Campaign.Name"],
                       Ad.Group = paste(cmp[c, "Campaign.Name"], " - Broad"),
                       SKU = cmp[c, "FBM"],
                       Status = "Enabled"
        )

}



