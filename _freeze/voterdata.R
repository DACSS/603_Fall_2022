# Intro ----
rm(list=ls())
library(tidyverse)
library(readxl)

# Reading In Data ---- 
# MIT Election Lab data ==== 

election_full <- read_csv("/Users/boonstra/Documents/github/603_Fall_2022/_freeze/mit_election_1976_2020.csv")

election_full <- election_full %>% 
  mutate(party_simplified2 = case_when(
    party_detailed == "DEMOCRAT" ~ "DEMOCRAT",
    party_detailed == "REPUBLICAN" ~ "REPUBLICAN",
    party_detailed == "LIBERTARIAN" ~ "LIBERTARIAN",
    party_detailed == "GREEN" ~ "GREEN",
    party_detailed == "INDEPENDENT" ~ "INDEPENDENT",
    TRUE ~ "OTHER"
  )) %>% 
  mutate(party_dem = case_when(
    party_detailed == "DEMOCRAT" ~ 1,
    TRUE ~ 0
  ))

head(election_full, n=20)
summary(election_full)




# NCSL Voter ID Chronology Data ====
## Obtained 10/11/22

voter_id <- read_excel("/Users/boonstra/Documents/github/603_Fall_2022/_freeze/voter_id_chronology.xlsx",
                      skip = 2,
                      col_types = c("text","skip","text","skip","text","skip",
                                    "text","skip","text","skip","text","skip",
                                    "text","skip","skip"))

voter_id <- voter_id %>% 
  pivot_longer(cols=c(2:7),
               names_to="year",
               values_to="id_text") %>% 
  mutate(id_req = case_when(
    grepl("no id", id_text, ignore.case = TRUE) ~ 0,
    TRUE ~ 1
  )) %>% 
  mutate(id_strict = case_when(
    grepl("Strict", id_text) ~ 1,
    TRUE ~ 0
  )) %>% 
  mutate(id_photo = case_when(
    grepl(" photo", id_text, ignore.case = TRUE) ~ 1,
    TRUE ~ 0
  ))


# USEP 1980-2014 turnout data ====

## Date Accessed 10/11/22
## citation https://www.electproject.org/election-data/faq/citation
## vep vs vap https://www.electproject.org/election-data/faq/vap-v-vap

turnout <- read_excel("/Users/boonstra/Documents/github/603_Fall_2022/_freeze/1980-2014 November General Election.xlsx",
                      skip=2,
                      col_types=c(
                        "numeric","skip","skip","text",
                        "numeric","numeric","numeric",
                        "numeric","numeric","numeric","numeric",
                        "numeric","numeric","numeric","numeric","numeric","numeric"
                      ),
                      col_names=c(
                        "year","state",
                        "totballots_vep_rate","highestoff_vep_rate","highestoff_vap_rate",
                        "totalballots_count","highestoff_count","vep_count","vap_count",
                        "noncitizen_percent","prison_count","probation_count",
                        "parole_count","totineligible_count","overseas_count"
                      ))

head(turnout,n=20)
summary(turnout)



#### USEP 2000 turnout data ####

## Date Accessed 10/05/22
## citation https://www.electproject.org/election-data/faq/citation
## vep vs vap https://www.electproject.org/election-data/faq/vap-v-vap


turnout_2000 <- read_excel("/Users/boonstra/Documents/github/603_Fall_2022/_freeze/2000 November General Election.xlsx",
                           skip=2,
                           col_types=c("text","numeric","numeric","numeric",
                                       "numeric","numeric","numeric","numeric",
                                       "numeric","numeric","numeric","numeric",
                                       "numeric","numeric"),
                           col_names=c(
                             "state",
                             "totballots_vep_rate","highestoff_vep_rate","highestoff_vap_rate",
                             "totalballots_count","highestoff_count","vep_count","vap_count",
                             "noncitizen_percent","prison_count","probation_count",
                             "parole_count","totineligible_count","overseas_count"
                           ))


turnout_2000 <- turnout_2000 %>% 
  filter(state!="United States") %>% 
  mutate(year=2000)


#### USEP 2004 turnout data ####

## Date Accessed 10/05/22
## citation https://www.electproject.org/election-data/faq/citation
## vep vs vap https://www.electproject.org/election-data/faq/vap-v-vap




#### USEP 2008 turnout data ####

## Date Accessed 10/05/22
## citation https://www.electproject.org/election-data/faq/citation
## vep vs vap https://www.electproject.org/election-data/faq/vap-v-vap




#### USEP 2012 turnout data ####

## Date Accessed 10/05/22
## citation https://www.electproject.org/election-data/faq/citation
## vep vs vap https://www.electproject.org/election-data/faq/vap-v-vap




#### USEP 2016 turnout data ####

## Date Accessed 10/05/22
## citation https://www.electproject.org/election-data/faq/citation
## vep vs vap https://www.electproject.org/election-data/faq/vap-v-vap




#### USEP 2020 turnout data ####

## Date Accessed 10/05/22
## citation https://www.electproject.org/election-data/faq/citation
## vep vs vap https://www.electproject.org/election-data/faq/vap-v-vap



