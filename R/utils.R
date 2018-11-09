create_mlp_dataset <- function(){
  my_little_pony <- tibble::tribble(
    ~name,               ~kind,     ~canfly, ~hashorn, ~intofashion, ~intopranks,
    "twilight sparkle", "alicorn",  TRUE,    TRUE,     FALSE,        FALSE,
    "pinky pie",         "pony",    FALSE,   FALSE,    FALSE,         TRUE,
    "fluttershy",        "pegasus", TRUE,    FALSE,    TRUE,          FALSE,
    "rarity",            "unicorn", FALSE,   TRUE,     TRUE,          FALSE,
    "apply jack",        "pony",    TRUE,    FALSE,    FALSE,         TRUE,
  )
  save(my_little_pony, file = "data/my_little_pony.rda")
}
