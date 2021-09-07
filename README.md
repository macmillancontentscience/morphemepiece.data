
<!-- README.md is generated from README.Rmd. Please edit that file -->

# morphemepiece.data

<!-- badges: start -->
<!-- badges: end -->

The goal of morphemepiece.data is to provide stable, versioned English
morpheme data. This data can be used to tokenize words into morpheme
pieces, such as is implemented in the
[{morphemepiece}](https://github.com/macmillancontentscience/morphemepiece)
tokenizer package.

The data is compiled using the
{[wikimorphemes](https://github.com/macmillancontentscience/wikimorphemes)}
package.

## Installation

You can install the released version of morphemepiece.data from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("morphemepiece.data")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("macmillancontentscience/morphemepiece.data")
```

## Example

You likely won’t ever need to use this package directly. It contains two
functions to load data used by
{[morphemepiece](https://github.com/macmillancontentscience/morphemepiece)}.

``` r
library(morphemepiece.data)

head(morphemepiece_vocab())
#>  [PAD]  [UNK]  [CLS]  [SEP] [MASK]      ! 
#>      0      1      2      3      4      5
head(morphemepiece_lookup())
#>            aatheist           aatheists               aback              abacks 
#>       "a## atheist"   "a## atheist ##s"          "a## back"      "a## back ##s" 
#>           abackward          abacterial 
#>   "a## back ##ward" "a## bacteria ##al"
```

## Code of Conduct

Please note that the morphemepiece.data project is released with a
[Contributor Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.

## Disclaimer

This is not an officially supported Macmillan Learning product.

## Contact information

Questions or comments should be directed to Jonathan Bratt
(<jonathan.bratt@macmillan.com>) and Jon Harmon
(<jonthegeek@gmail.com>).
