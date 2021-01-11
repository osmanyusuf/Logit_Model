
load("~/Desktop/afrobarometer/wd/abfinal_cleaning.RData")

library(dplyr)
library(ggplot2)
library(cowplot)
library(jtools)
library(ggstance)

abfinal2 = abfinal %>% mutate(support = recode(support, "1" = "Doesn't matter",
                                     "2" = "Sometimes non-democratic preferable",
                                     "3" = "Democracy preferable",
                                     "9" = "Don't know")) -> abfinal

abfinal2$extent <- factor(abfinal2$`Q 50`)
is.factor(abfinal2$extent)

abfinal3 = abfinal2 %>% mutate(extent = recode(extent, "1" = "Not a democracy",
                                    "2" = "Democracy with major problems",
                                    "3" = "Democracy with minor problems",
                                    "4" = "A full democracy", "8" = "Do not understand",
                                    "9" = "Don't know")) -> abfinal2


names(abfinal3)[names(abfinal3) == "Q 01"] <- "age"
names(abfinal3)[names(abfinal3) == "Q 001"] <- "gender"
names(abfinal3)[names(abfinal3) == "DATEINTR"] <- "year"

abfinal3$demo <- factor(abfinal3$`Q 33`)
is.factor(abfinal3$demo)

abfinal3$issue <- factor(abfinal3$`Q 32`)

abfinal3$attend <- factor(abfinal3$`Q 31`)

abfinal3$yearfac <- factor(abfinal3$year)

abfinal4 = abfinal3 %>% mutate(demo = recode(demo, "0" = "Would never do this",
                                               "1" = "Would do if had the chance",
                                               "2" = "Once or twice",
                                               "3" = "Sevaral times",
                                               "4" = "Often",
                                               "9" = "Don't know")) -> abfinal3

abfinal5 = abfinal4 %>% mutate(issue = recode(issue, "0" = "Would never do this",
                                              "1" = "Would do if had the chance",
                                              "2" = "Once or twice",
                                              "3" = "Sevaral times",
                                              "4" = "Often",
                                              "9" = "Don't know")) -> abfinal4

abfinal5 = abfinal5 %>% mutate(attend = recode(attend, "0" = "Would never do this",
                                              "1" = "Would do if had the chance",
                                              "2" = "Once or twice",
                                              "3" = "Sevaral times",
                                              "4" = "Often",
                                              "9" = "Don't know")) -> abfinal5
