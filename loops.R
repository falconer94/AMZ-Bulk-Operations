for (i in 1:nrow(NewCamp)) {
  add_row(temp, Record.Type = "Campaign",
          Campaign = NewCamp[i, "Campaign.Name"],
          Campaign.Targeting.Type = "Manual",
          Portfolio.ID = "Nutricost",
          Ad.Group = "Exact",
          Campaign.Status = "Enabled",
          Bidding.strategy = "Off")
}



rm(c)
rm(temp2)
temp2 <- temp
# winner
for (c in 1:nrow(NewCamp)){
  temp2 <- add_row(temp2, Record.Type = "Campaign",
                  Campaign = NewCamp[c, "Campaign.Name"],
                  Campaign.Targeting.Type = "Manual",
                  Portfolio.ID = "Nutricost",
                  Ad.Group = paste(NewCamp[c, "Campaign.Name"], " - Exact"),
                  Campaign.Status = "Enabled",
                  Bidding.strategy = "Off")
}


