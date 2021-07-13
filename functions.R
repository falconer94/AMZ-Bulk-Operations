C <- function(x){
  add_row(temp, Record.Type = "Campaign",
          Campaign = x)
}

map(temp, C)

