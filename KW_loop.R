#### Keyword 1 2 3 ####
# Import List with Campaign name and keywords
# Keywords and SKUs/ASINs are independantly tied to Ad Groups

#### Import ####
kw <- read.csv("Raw_data/NewCamp.KWs.csv")

## Fill in blanks with NA ##
 # replace_with_na(kw[6,"Keyword.3"])   # needs naniar package

kw <- replace(kw, kw == "", NA)


#### Loop ####
# 1-3
# Record Type = Keyword,
# Campaign = c,
# Ad.Group = paste(cmp[c, "Campaign.Name"], " - Exact"),
# Max.Bid = 2, 1.25, 0.75
# Keyword.or.Product.Targeting = k,
# Match.Type = Exact, Phrase, Broad
# Status = Enabled

rm(c,k)

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


