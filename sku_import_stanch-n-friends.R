sku <- read.csv("Staunch and Friends Tracking - Product_Info.csv") %>% 
  select(ASIN, SKU, FBA.SKU.) %>% 
  filter(ASIN != "")

