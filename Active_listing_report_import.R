library(tidyverse)

# https://sellercentral.amazon.com/forums/t/how-can-i-have-a-report-of-my-fbm-list-of-asin-sku/157970

#### How to read report ####
# https://sellercentral.amazon.com/gp/help/help.html?itemID=200385890&language=en_US&ref=efph_200385890_cont_561

# fulfillment channel

  # wrangle observation to variable; combine ASINs? 

duplicated(alr$ASIN)


# asin1 = ASIN
# product.id = UPC



#### ####
alr <- read.delim("Active+Listings+Report+07-02-2021.txt") %>% 
  select(asin1, seller.sku, fulfillment.channel) %>% 
  rename(ASIN = asin1, SKU = seller.sku, fulfillment = fulfillment.channel) %>%
  arrange(ASIN)

# Change to   
  # DEFAULT = FBM
  # AMAZON_NA = FBA
alr$fulfillment <- str_replace_all(alr$fulfillment, "DEFAULT", "FBM") %>% 
  str_replace_all("AMAZON_NA", "FBA")


#### spread ####
# key becomes columns
# value becomes values of new columns

 

alr2 <- alr %>%
  spread(fulfillment, SKU)
  
# error; duplicate identifiers

alr[208,]
alr[209,]  


# pivot_wider()?





