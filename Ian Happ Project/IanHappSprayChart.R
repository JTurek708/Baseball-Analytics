### Ian Happ Analysis
library(tidyverse)
devtools::install_github("BillPetti/baseballr")
1
library(baseballr)
library(ggthemes)
library(gt)
library(gtExtras)

# Scrape Statcast for Happ for 2022 season
ian_happ <- scrape_statcast_savant(start_date = "2022-04-01",
                                   end_date = "2022-04-30",
                                   playerid = 664023,
                                   player_type = "batter")
View(ian_happ)
# Select variables and filter for Happ's switch hitting
ian_happ_right <- ian_happ %>%
  select(events, hc_x, hc_y, stand, type) %>%
  filter(stand == "R")
ian_happ_left <- ian_happ %>%
  select(events, hc_x, hc_y, stand, type) %>%
  filter(stand == "L")
View(ian_happ_left)
View(ian_happ_right)

# Filter down to batted balls
ian_happ_right <- ian_happ_right %>%
  filter(type == 'X')
ian_happ_left <- ian_happ_left %>%
  filter(type == 'X')

# Create own spray chart function
spray_chart <- function(...){
  ggplot(...) +
    geom_curve(x=33, xend=223, y=-100, yend=-100,
               curvature = -.65) +
    geom_segment(x = 128, xend = 33, y = -208, yend = -100)+
    geom_segment(x = 128, xend = 223, y = -208, yend = -100)+
    geom_curve(x = 83, xend = 173, y = -155, yend = -156,
               curvature = -.65, linetype = 'dotted') + 
    coord_fixed() +
    scale_x_continuous(breaks = NULL, limits = c(25, 225)) +
    scale_y_continuous(breaks = NULL, limits = c(-225, -25))
}

spray_chart(ian_happ_left, aes(x = hc_x, y = -hc_y, color = events)) +
  geom_point() +
  scale_color_economist() +
  labs(title = "Ian Happ Spray Chart \nLeft-Handed Hitting",
       subtitle = "April 2022",
       color = "Batted Ball Events") +
  theme_fivethirtyeight() 

spray_chart(ian_happ_right, aes(x = hc_x, y = -hc_y, color = events)) +
  geom_point() +
  scale_color_economist() +
  labs(title = "Ian Happ Spray Chart \nRight-Handed Hitting",
       subtitle = "April 2022",
       color = "Batted Ball Events") +
  theme_fivethirtyeight()

### Season Long Spray Chart ###
# Scrape Statcast for Happ for 2022 season
ian_happ <- scrape_statcast_savant(start_date = "2022-04-01",
                                   end_date = "2022-09-18",
                                   playerid = 664023,
                                   player_type = "batter")

ian_happ_right <- ian_happ %>%
  select(events, hc_x, hc_y, stand, type) %>%
  filter(stand == "R")
ian_happ_left <- ian_happ %>%
  select(events, hc_x, hc_y, stand, type) %>%
  filter(stand == "L")

# Filter down to batted balls
ian_happ_right <- ian_happ_right %>%
  filter(type == 'X')
ian_happ_left <- ian_happ_left %>%
  filter(type == 'X')

# Happ's Left-Handed Spray Chart 2022 Season
spray_chart(ian_happ_left, aes(x = hc_x, y = -hc_y, color = events)) +
  geom_point() +
  scale_color_economist() +
  labs(title = "Ian Happ Spray Chart \nLeft-Handed Hitting",
       subtitle = "2022 Season",
       color = "Batted Ball Events") +
  theme_fivethirtyeight() 

# Happ's Right-Handed Spray Chart 2022 Season
spray_chart(ian_happ_right, aes(x = hc_x, y = -hc_y, color = events)) +
  geom_point() +
  scale_color_economist() +
  labs(title = "Ian Happ Spray Chart \nRight-Handed Hitting",
       subtitle = "2022 Season",
       color = "Batted Ball Events") +
  theme_fivethirtyeight() 

# Shifts against Happ - Right
shift_happ_right <- ian_happ %>%
  select(events, hc_x, hc_y, type, if_fielding_alignment, launch_angle, stand) %>%
  filter(stand == 'R')
View(shift_happ_right)
shift_happ_right <- shift_happ_right %>%
  filter(type == "X")

# Percentage of balls Happ pulled as a righty - hc_x< 125.42
happ_shift_data_right <- shift_happ_right %>%
  filter(launch_angle < 10)
View(happ_shift_data_right)

happ_shift_data_right <- shift_happ_right %>%
  summarise(N = n(),
            P_opp = 100 * mean(hc_x < 125.42, na.rm=TRUE),
            Shift = 100 * mean(if_fielding_alignment == "Infield shift",
                               na.rm=TRUE))

happ_shift_data_right %>%
  gt() %>%
  gt_theme_538() %>%
  tab_header(
    title = "Ian Happ's Right-Handed Pulling & Defensive Shift %",
    subtitle = "2022 Season") %>%
  cols_label(N = "# of Balls Pulled",
             P_opp = "% of Balls Pulled",
             Shift = "% of Defensive Shifts")

# Shifts against Happ - Left
shift_happ_left <- ian_happ %>%
  select(events, hc_x, hc_y, type, if_fielding_alignment, launch_angle, stand) %>%
  filter(stand == 'L')
View(shift_happ_left)
shift_happ_left <- shift_happ_left %>%
  filter(type == "X")

# Percentage of balls Happ pulled as a lefty - hc_x > 125.42
happ_shift_data_left <- shift_happ_left %>%
  filter(launch_angle < 10)
View(happ_shift_data_left)
happ_shift_data_left <- shift_happ_left %>%
  summarise(N = n(),
            P_opp = 100 * mean(hc_x > 125.42, na.rm=TRUE),
            Shift = 100 * mean(if_fielding_alignment == "Infield shift",
                               na.rm=TRUE))
happ_shift_data_left %>%
  gt() %>%
  gt_theme_538() %>%
  tab_header(
    title = "Ian Happ's Left-Handed Pulling & Defensive Shift %",
    subtitle = "2022 Season") %>%
  cols_label(N = "# of Balls Pulled",
             P_opp = "% of Balls Pulled",
             Shift = "% of Defensive Shifts")
