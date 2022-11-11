### Catcher Framing MLB - Cubs Free Agent Preview
library(tidyverse)
library(pitchRx)
library(baseballr)
library(ggrepel)
library(ggthemes)
library(mgcv)
library(broom)
library(modelr)
library(lme4)
library(reactable)
install.packages("reactablefmtr")
library(reactablefmtr)
library(gt)
library(gtExtras)
library(scales)

# Filter DF for prospective FAs
cubs_freeagents <- catcher_framing %>%
  filter(last_name == 'Narvaez' | last_name == 'Barnhart' |
           last_name == 'Hedges' | last_name == 'Sanchez' |
           last_name == 'Vazquez' | last_name == 'Contreras')
View(cubs_freeagents)
cubs_freeagents <- cubs_freeagents %>%
  filter(first_name != 'William')

# Defensive analysis - Catcher Framing
# select columns
cubs_freeagents <- cubs_freeagents %>%
  select(last_name, first_name, n_called_pitches, runs_extra_strikes, strike_rate)

# Create color scale for table

catcher_table <- reactable(cubs_freeagents,
          columns = list(
            last_name = colDef(name = "Last Name"),
            first_name = colDef(name = 'First Name'),
            n_called_pitches = colDef(name = 'Pitches Caught'),
            runs_extra_strikes = colDef(name = 'Runs Saved'),
            strike_rate = colDef(name = 'Strike Rate')
          ),
          highlight = TRUE, striped = TRUE, bordered = TRUE)
catcher_table %>%
  add_title("Top Free Agent Catchers (MLB Trade Rumors)",
            font_size = 23)

# Offensive Stats for these FA targets
cubs_freeagents_off <- stats_1_ %>%
  filter(last_name == 'Hedges' | last_name == 'Narvaez' | last_name == 'Barnhart' |
           last_name == 'Sanchez' | last_name  == 'Vazquez' | last_name == 'Contreras')
View(cubs_freeagents_off)
cubs_freeagents_off <- cubs_freeagents_off %>%
  filter(first_name != 'William')
cubs_freeagents_off <- cubs_freeagents_off %>%
  filter(first_name != 'Jesus')
cubs_freeagents_off <- cubs_freeagents_off %>%
  select(last_name, first_name, xba, xslg, exit_velocity_avg, launch_angle_avg,
         sweet_spot_percent, barrel_batted_rate)

# Create table for offensive
offensive_table <- cubs_freeagents_off %>%
  gt() %>%
  cols_hide(columns = c(sweet_spot_percent, barrel_batted_rate)) %>%
  cols_label(last_name = 'Last Name',
             first_name = 'First Name',
             xba = 'Expected Batting Avg',
             xslg = 'Expected Slugging',
             exit_velocity_avg = 'Avg Exit Velo',
             launch_angle_avg = 'Avg Launch Angle') %>%
  tab_header(title = md("Potential Free Agent Catchers, Offensive Statistics, 2022 Season")) %>%
  tab_source_note(source_note = 'Source: MLB Savant & Statcast') %>%
  tab_style(
    locations = cells_column_labels(columns = everything()),
    style = list(
      cell_borders(sides = "bottom", weight = px(3)),
      cell_text(weight = 'bold')
    )
  ) %>%
  tab_style(
    locations = cells_title(groups = 'title'),
    style = list(cell_text(weight = 'bold', size = 22))
  )
offensive_table

## Pop Times
catcher_poptime <- poptime %>%
  filter(catcher == 'Austin Hedges' | catcher == 'Willson Contreras' |
           catcher == 'Gary Sanchez' | catcher == 'Tucker Barnhart' |
           catcher == 'Omar Narvaez' | catcher == 'Christian Vazquez')
View(catcher_poptime)
catcher_poptime <- catcher_poptime %>%
  select(catcher, maxeff_arm_2b_3b_sba, exchange_2b_3b_sba, pop_2b_sba_count, pop_2b_sb, pop_2b_cs)
poptime_table <- catcher_poptime %>%
  gt() %>%
  cols_label(catcher = 'Catcher',
             maxeff_arm_2b_3b_sba = 'Arm Strength (mph)',
             exchange_2b_3b_sba = 'Exchange Time',
             pop_2b_sba_count = 'Total Stolen Base Attempts (2B)',
             pop_2b_sb = 'Stolen Base Pop Time',
             pop_2b_cs = 'Caught Stealing Pop Time') %>%
  tab_header(title = md('Potential Free Agent Catchers, Pop Times, 2022 Season')) %>%
  tab_source_note(source_note = 'Source: MLB Savant & Statcast') %>%
  tab_style(
    locations = cells_column_labels(columns = everything()),
    style = list(
      cell_borders(sides = "bottom", weight = px(3)),
      cell_text(weight = 'bold')
    )
  ) %>%
  tab_style(
    locations = cells_title(groups = 'title'),
    style = list(cell_text(weight = 'bold', size = 22))
  )
poptime_table
