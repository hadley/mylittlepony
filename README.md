
<!-- README.md is generated from README.Rmd. Please edit that file -->

# mylittlepony

The goal of mylittlepony is to …

## Installation

You can install the released version of mylittlepony from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("mylittlepony")
```

## Example

## Pony data

The package includes a small dataset with each of the main pony’s data.
The data includes preferences and features that when compared to another
inside the group, they could be something they have in common, or
something they could learn from each other.

``` r
library(mylittlepony)

my_little_pony
#> # A tibble: 5 x 6
#>   name             kind    canfly hashorn intofashion intopranks
#>   <chr>            <chr>   <lgl>  <lgl>   <lgl>       <lgl>     
#> 1 twilight sparkle alicorn TRUE   TRUE    FALSE       FALSE     
#> 2 pinky pie        pony    FALSE  FALSE   FALSE       TRUE      
#> 3 fluttershy       pegasus TRUE   FALSE   TRUE        FALSE     
#> 4 rarity           unicorn FALSE  TRUE    TRUE        FALSE     
#> 5 apply jack       pony    TRUE   FALSE   FALSE       TRUE
```

## Hanging out

The first function to review is `hang_out()`. It selects two or more
randomly selected friends (rows).

``` r
library(dplyr)

my_little_pony  %>%
  hang_out() 
#> # A tibble: 2 x 6
#>   name             kind    canfly hashorn intofashion intopranks
#>   <chr>            <chr>   <lgl>  <lgl>   <lgl>       <lgl>     
#> 1 apply jack       pony    TRUE   FALSE   FALSE       TRUE      
#> 2 twilight sparkle alicorn TRUE   TRUE    FALSE       FALSE
```

The number of friends can be overriden:

``` r
my_little_pony  %>%
  hang_out(3) 
#> # A tibble: 3 x 6
#>   name       kind    canfly hashorn intofashion intopranks
#>   <chr>      <chr>   <lgl>  <lgl>   <lgl>       <lgl>     
#> 1 fluttershy pegasus TRUE   FALSE   TRUE        FALSE     
#> 2 rarity     unicorn FALSE  TRUE    TRUE        FALSE     
#> 3 pinky pie  pony    FALSE  FALSE   FALSE       TRUE
```

## Magic of friendship\!\!

The `magic_of_friendship()` function compares two or more friend’s
preferences and features to tell them what they have in common and what
they can learn from each other\!

The function returns a list with three data frames:

1.  Names
2.  Things in common
3.  Things they can learn from each other

<!-- end list -->

``` r
my_little_pony  %>%
  hang_out()  %>%
  magic_of_friendship()
#> $friends
#> # A tibble: 2 x 1
#>   name            
#>   <chr>           
#> 1 rarity          
#> 2 twilight sparkle
#> 
#> $things_in_common
#> # A tibble: 2 x 2
#>   hashorn intopranks
#>   <lgl>   <lgl>     
#> 1 TRUE    FALSE     
#> 2 TRUE    FALSE     
#> 
#> $learn_from_each_other
#> # A tibble: 2 x 4
#>   name             kind    canfly intofashion
#>   <chr>            <chr>   <lgl>  <lgl>      
#> 1 rarity           unicorn FALSE  TRUE       
#> 2 twilight sparkle alicorn TRUE   FALSE
```

### It works with other data

The functions actually work with other data sets:

``` r
library(tibble)

mtcars %>%
  rownames_to_column("model") %>%
  hang_out(3) %>%
  magic_of_friendship("model")
#> $friends
#> [1] "Pontiac Firebird" "Volvo 142E"       "Mazda RX4 Wag"   
#> 
#> $things_in_common
#> data frame with 0 columns and 3 rows
#> 
#> $learn_from_each_other
#>               model  mpg cyl disp  hp drat    wt  qsec vs am gear carb
#> 25 Pontiac Firebird 19.2   8  400 175 3.08 3.845 17.05  0  0    3    2
#> 32       Volvo 142E 21.4   4  121 109 4.11 2.780 18.60  1  1    4    2
#> 2     Mazda RX4 Wag 21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
```
