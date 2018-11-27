First Letter Counts
================
Curtis Fox

``` r
options(warn = -1) # supresses warnings
suppressPackageStartupMessages(library(tidyverse))
```

    ## Note: the specification for S3 class "difftime" in package 'lubridate' seems equivalent to one from package 'hms': not turning on duplicate class definitions for this class.

``` r
library(tidyverse)
```

This code takes in a dataset containing the frequencies of each lower-case letter as a starting character in the words contained in the word.txt file. I then plot these frequencies using a scatterplot. Then I save the plot to a file, and render it in the markdown.

``` r
data <- read.csv("letterCount.csv")
plot <- ggplot(data, aes(Count, Letters, colour = Count)) +
  geom_point() + 
  ggtitle("First Letter Count Frequency") 
ggsave("letterCount.png")
```

    ## Saving 7 x 5 in image

![](letterCount.png)
