#### AMZ Bulk Operations ####

library(tidyverse)

#### Import and Tidy ####

temp <- read.csv("Raw_data/Sponsored_Prod_Bulk_Ops_Temp.csv") %>% 
  mutate_if(is.logical, as.character)
names(temp)


NewCamp <- read.csv("Raw_data/ASIN-Prod-CampaignName.csv") %>% 
  select(-Product)

# ASINS and SKUs
alr <- read.delim("Raw_data/Active+Listings+Report+07-02-2021.txt") %>% 
  select(asin1, seller.sku, fulfillment.channel) %>% 
  rename(ASIN = asin1, SKU = seller.sku, fulfillment = fulfillment.channel) %>%
  arrange(ASIN)

# Change to   
# DEFAULT = FBM
# AMAZON_NA = FBA

alr$fulfillment <- str_replace_all(alr$fulfillment, "DEFAULT", "FBM") %>% 
  str_replace_all("AMAZON_NA", "FBA")


# Join alr and NewCamp

cmp <- left_join(NewCamp, alr)


# NA SKUs

no_sku <- cmp[is.na(cmp$SKU),]

cmp <- drop_na(cmp)



# Spread

cmp <- spread(cmp, fulfillment, SKU)


blk <- temp 

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



#### Keyword 1 2 3 ####
# Import List with Campaign name and keywords
# Keywords and SKUs/ASINs are independantly tied to Ad Groups

#### Import ####
kw <- read.csv("Raw_data/NewCamp.KWs.csv")

## Fill in blanks with NA ##
# replace_with_na(kw[6,"Keyword.3"])   # needs naniar package

kw <- replace(kw, kw == "", NA)


#### KW Loop ####
# 1-3
# Record Type = Keyword,
# Campaign = c,
# Ad.Group = paste(cmp[c, "Campaign.Name"], " - Exact"),
# Max.Bid = 2, 1.25, 0.75
# Keyword.or.Product.Targeting = k,
# Match.Type = Exact, Phrase, Broad
# Status = Enabled


kw2 <- temp



# 1
for (c in 1:nrow(kw)){ 
  for (k in 1:ncol(kw)) {
    if(!is.na(kw[c,k])){
      kw2 <- add_row(kw2,
                     Record.Type = "Keyword",
                     Campaign = kw[c,1],
                     Ad.Group = paste(kw[c,1], " - Exact"),
                     Max.Bid = "2",
                     Keyword.or.Product.Targeting = kw[c,k],
                     Match.Type = "Exact",
                     Status = "Enabled"
      )}
  }
}

# 2
for (c in 1:nrow(kw)){ 
  for (k in 1:ncol(kw)) {
    if(!is.na(kw[c,k])){
      kw2 <- add_row(kw2,
                     Record.Type = "Keyword",
                     Campaign = kw[c,1],
                     Ad.Group = paste(kw[c,1], " - Phrase"),
                     Max.Bid = "1.25",
                     Keyword.or.Product.Targeting = kw[c,k],
                     Match.Type = "Phrase",
                     Status = "Enabled"
      )}
  }
}

# 3
for (c in 1:nrow(kw)){ 
  for (k in 1:ncol(kw)) {
    if(!is.na(kw[c,k])){
      kw2 <- add_row(kw2,
                     Record.Type = "Keyword",
                     Campaign = kw[c,1],
                     Ad.Group = paste(kw[c,1], " - Broad"),
                     Max.Bid = "0.75",
                     Keyword.or.Product.Targeting = kw[c,k],
                     Match.Type = "Broad",
                     Status = "Enabled"
      )}
  }
}



#### Join KW and blk ####
blk_ops <- full_join(blk, kw2)



#### Export ####

write.csv(blk_ops, "bulk_ops_07-2021.csv")
