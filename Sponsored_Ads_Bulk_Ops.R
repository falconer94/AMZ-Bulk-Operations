library(tidyverse)






# Join ASIN and Campaign names with FBM and FBA SKUs


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




rm(c)
rm(blk)
blk <- temp 


