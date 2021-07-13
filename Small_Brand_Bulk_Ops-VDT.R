library(tidyverse)


df <- read.csv("Sponsored_Prod_Bulk_Ops_Temp.csv")
names(df)



# Join ASIN and Campaign names with FBM and FBA SKUs
# from AMZ Inv paste/Staunch n friends

VDT <- read.csv("VDT.csv")
names(VDT)

# Campaign Column name
VDT <- rename(VDT, Campaign = ï..Campaign)


#### Campaign ####
# Record Type = Campaign 
# Campaign = *enter into list
# Campaign Daily Budget = 50
# Campaign Start date = 7/1/21
# Campaign Targeting Type = Manual
# Portfolio ID = Nutricost
# Ad Group = (campaign name) - Exact
# Campaign Status = Enabled
# Bidding Strategy = Off

VDT %>% 
  slice(1) %>% 
  






#### AdGroup ####
# Loop adgroups to add campaign name with "exact" etc.
# Max bid
# Exact = 2
# Phrase = 1.25
# Broad = 0.75
# Ad Group Status = Enabled




#### Ad record type ####

# Duplicate Ad for FBM and FBA SKUs
# Status = Enabled



#### Keyword ####
# Max bid
# Keyword; *enter into list for loop
# Match Type
# Status = Enabled

