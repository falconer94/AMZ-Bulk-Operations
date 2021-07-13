FBA <- read.delim("FBA_inv_report.txt") %>%
  select(sku, fnsku, asin) %>% 
  rename(mSKU = sku, ASIN = asin)

# inv reports include both but doesn't distinquish them
lst <- read.delim("All+Listings+Report+07-12-2021.txt") %>% 
  rename(SKU = ï..seller.sku, ASIN = asin1) %>% 
  select(ASIN, SKU) 
