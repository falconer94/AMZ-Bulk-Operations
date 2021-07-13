library(tidyverse)


temp <- read.csv("Raw_data/Sponsored_Prod_Bulk_Ops_Temp.csv") %>% 
  mutate_if(is.logical, as.character)
names(temp)



# Join ASIN and Campaign names with FBM and FBA SKUs
  # mSKU from AMZ Prods sheet (Walmart & others book)
  # aSKU from AMZ FBA Inv/listings reports


# prd <- read.delim("All+Listings+Report+07-12-2021.txt") %>% 
#   rename(mSKU = ï..seller.sku, ASIN = asin1)
#   select()
# names(prd)
# SKU <- read.table(file = "FBA_inv_report.txt", sep ="\t", header = TRUE) %>% 
#   select(asin, fnsku, sku) %>% 
#   rename(ASIN = asin, mSKU = fnsku, SKU = sku)
# full_join(NewCamp, SKU)











#### Import and Tidy ####
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

# B015HYTM1Q      Saw Palmetto Extract Capsules 

cmp <- drop_na(cmp)



# Spread eagle

cmp <- spread(cmp, fulfillment, SKU)




rm(c)
rm(blk)
blk <- temp 


