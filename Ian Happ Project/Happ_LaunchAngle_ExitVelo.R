### Ian Happ's Launch Angles & Velocity Throughout Career

# Load packages
library(tidyverse)
devtools::install_github("BillPetti/baseballr")
1
library(baseballr)
library(ggthemes)
library(gt)
library(gtExtras)

# Download Statcast data for 2017 season - Happ's first year in the bigs
ian_happ_2017 <- scrape_statcast_savant(start_date = "2017-04-01",
                                   end_date = "2017-10-30",
                                   playerid = 664023,
                                   player_type = "batter")
View(ian_happ_2017)

# Filter for only when Happ put the ball in play
ian_happ_2017 <- ian_happ_2017 %>%
  filter(type == "X")

# Create guidelines for launch angles and batted balls
guidelines <- tibble(
  launch_angle = c(10, 25, 50),
  launch_speed = 40,
  label = c("Ground balls", "Line drives", "Flyballs")
)

# Plot for Happ's 2017 season
happ_2017_plot <- ian_happ_2017 %>%
  # for speed
  sample_n(nrow(.) / 2) %>%
  ggplot(aes(x = launch_speed, y = launch_angle,
             color = estimated_ba_using_speedangle)) +
  geom_hline(data = guidelines, aes(yintercept=launch_angle),
             color = "black", linetype = 3) +
  geom_text(data = guidelines,
            aes(label = label, y = launch_angle - 4), color = 'black',
            hjust = 'left') +
  geom_point(alpha = .5) +
  scale_color_gradient("Estimated Batting Avg", low = 'blue', high = 'white') +
  scale_x_continuous('Exit Velocity (MPH)',
                     limits = c(40, 120)) +
  scale_y_continuous("Launch Angle (Degrees)",
                     breaks = seq(-75, 75, 25)) +
  theme_classic() +
  labs(title = "Ian Happ's Launch Angle & Exit Velocity, 2017 Season")
happ_2017_plot

# Download Statcast data for 2018 season 
ian_happ_2018 <- scrape_statcast_savant(start_date = "2018-04-01",
                                        end_date = "2018-10-30",
                                        playerid = 664023,
                                        player_type = "batter")
View(ian_happ_2018)

# Filter for only when Happ put the ball in play
ian_happ_2018 <- ian_happ_2018 %>%
  filter(type == "X")

# Create guidelines for launch angles and batted balls
guidelines <- tibble(
  launch_angle = c(10, 25, 50),
  launch_speed = 40,
  label = c("Ground balls", "Line drives", "Flyballs")
)

# Plot for Happ's 2017 season
happ_2018_plot <- ian_happ_2018 %>%
  # for speed
  sample_n(nrow(.) / 2) %>%
  ggplot(aes(x = launch_speed, y = launch_angle,
             color = estimated_ba_using_speedangle)) +
  geom_hline(data = guidelines, aes(yintercept=launch_angle),
             color = "black", linetype = 3) +
  geom_text(data = guidelines,
            aes(label = label, y = launch_angle - 4), color = 'black',
            hjust = 'left') +
  geom_point(alpha = .5) +
  scale_color_gradient("Estimated Batting Avg", low = 'blue', high = 'white') +
  scale_x_continuous('Exit Velocity (MPH)',
                     limits = c(40, 120)) +
  scale_y_continuous("Launch Angle (Degrees)",
                     breaks = seq(-75, 75, 25)) +
  theme_classic() +
  labs(title = "Ian Happ's Launch Angle & Exit Velocity, 2018 Season")
happ_2018_plot

# Download Statcast data for 2019 season 
ian_happ_2019 <- scrape_statcast_savant(start_date = "2019-04-01",
                                        end_date = "2019-10-30",
                                        playerid = 664023,
                                        player_type = "batter")
View(ian_happ_2019)

# Filter for only when Happ put the ball in play
ian_happ_2019 <- ian_happ_2019 %>%
  filter(type == "X")

# Create guidelines for launch angles and batted balls
guidelines <- tibble(
  launch_angle = c(10, 25, 50),
  launch_speed = 40,
  label = c("Ground balls", "Line drives", "Flyballs")
)

# Plot for Happ's 2017 season
happ_2019_plot <- ian_happ_2019 %>%
  # for speed
  sample_n(nrow(.) / 2) %>%
  ggplot(aes(x = launch_speed, y = launch_angle,
             color = estimated_ba_using_speedangle)) +
  geom_hline(data = guidelines, aes(yintercept=launch_angle),
             color = "black", linetype = 3) +
  geom_text(data = guidelines,
            aes(label = label, y = launch_angle - 4), color = 'black',
            hjust = 'left') +
  geom_point(alpha = .5) +
  scale_color_gradient("Estimated Batting Avg", low = 'blue', high = 'white') +
  scale_x_continuous('Exit Velocity (MPH)',
                     limits = c(40, 120)) +
  scale_y_continuous("Launch Angle (Degrees)",
                     breaks = seq(-75, 75, 25)) +
  theme_classic() +
  labs(title = "Ian Happ's Launch Angle & Exit Velocity, 2019 Season")
happ_2019_plot

# Download Statcast data for 2020 season
ian_happ_2020 <- scrape_statcast_savant(start_date = "2020-04-01",
                                        end_date = "2020-10-30",
                                        playerid = 664023,
                                        player_type = "batter")
View(ian_happ_2020)

# Filter for only when Happ put the ball in play
ian_happ_2020 <- ian_happ_2020 %>%
  filter(type == "X")

# Create guidelines for launch angles and batted balls
guidelines <- tibble(
  launch_angle = c(10, 25, 50),
  launch_speed = 40,
  label = c("Ground balls", "Line drives", "Flyballs")
)

# Plot for Happ's 2017 season
happ_2020_plot <- ian_happ_2020 %>%
  # for speed
  sample_n(nrow(.) / 2) %>%
  ggplot(aes(x = launch_speed, y = launch_angle,
             color = estimated_ba_using_speedangle)) +
  geom_hline(data = guidelines, aes(yintercept=launch_angle),
             color = "black", linetype = 3) +
  geom_text(data = guidelines,
            aes(label = label, y = launch_angle - 4), color = 'black',
            hjust = 'left') +
  geom_point(alpha = .5) +
  scale_color_gradient("Estimated Batting Avg", low = 'blue', high = 'white') +
  scale_x_continuous('Exit Velocity (MPH)',
                     limits = c(40, 120)) +
  scale_y_continuous("Launch Angle (Degrees)",
                     breaks = seq(-75, 75, 25)) +
  theme_classic() +
  labs(title = "Ian Happ's Launch Angle & Exit Velocity, 2020 Season")
happ_2020_plot

# Download Statcast data for 2021 season
ian_happ_2021 <- scrape_statcast_savant(start_date = "2021-04-01",
                                        end_date = "2021-10-30",
                                        playerid = 664023,
                                        player_type = "batter")
View(ian_happ_2021)

# Filter for only when Happ put the ball in play
ian_happ_2021 <- ian_happ_2021 %>%
  filter(type == "X")

# Create guidelines for launch angles and batted balls
guidelines <- tibble(
  launch_angle = c(10, 25, 50),
  launch_speed = 40,
  label = c("Ground balls", "Line drives", "Flyballs")
)

# Plot for Happ's 2017 season
happ_2021_plot <- ian_happ_2021 %>%
  # for speed
  sample_n(nrow(.) / 2) %>%
  ggplot(aes(x = launch_speed, y = launch_angle,
             color = estimated_ba_using_speedangle)) +
  geom_hline(data = guidelines, aes(yintercept=launch_angle),
             color = "black", linetype = 3) +
  geom_text(data = guidelines,
            aes(label = label, y = launch_angle - 4), color = 'black',
            hjust = 'left') +
  geom_point(alpha = .5) +
  scale_color_gradient("Estimated Batting Avg", low = 'blue', high = 'white') +
  scale_x_continuous('Exit Velocity (MPH)',
                     limits = c(40, 120)) +
  scale_y_continuous("Launch Angle (Degrees)",
                     breaks = seq(-75, 75, 25)) +
  theme_classic() +
  labs(title = "Ian Happ's Launch Angle & Exit Velocity, 2021 Season")
happ_2021_plot

# Download Statcast data for 2022 season - Happ's first All-Star
ian_happ_2022 <- scrape_statcast_savant(start_date = "2022-04-01",
                                        end_date = "2022-10-30",
                                        playerid = 664023,
                                        player_type = "batter")
View(ian_happ_2022)

# Filter for only when Happ put the ball in play
ian_happ_2022 <- ian_happ_2022 %>%
  filter(type == "X")

# Create guidelines for launch angles and batted balls
guidelines <- tibble(
  launch_angle = c(10, 25, 50),
  launch_speed = 40,
  label = c("Ground balls", "Line drives", "Flyballs")
)

# Plot for Happ's 2012 season
happ_2022_plot <- ian_happ_2022 %>%
  # for speed
  sample_n(nrow(.) / 2) %>%
  ggplot(aes(x = launch_speed, y = launch_angle,
             color = estimated_ba_using_speedangle)) +
  geom_hline(data = guidelines, aes(yintercept=launch_angle),
             color = "black", linetype = 3) +
  geom_text(data = guidelines,
            aes(label = label, y = launch_angle - 4), color = 'black',
            hjust = 'left') +
  geom_point(alpha = .5) +
  scale_color_gradient("Estimated Batting Avg", low = 'blue', high = 'white') +
  scale_x_continuous('Exit Velocity (MPH)',
                     limits = c(40, 120)) +
  scale_y_continuous("Launch Angle (Degrees)",
                     breaks = seq(-75, 75, 25)) +
  theme_classic() +
  labs(title = "Ian Happ's Launch Angle & Exit Velocity, 2022 Season",
       subtitle = "First All-Star Selection")
happ_2022_plot

# Calculate Happ's average launch angles for the last 5 seasons
avg_la_2017 <- mean(ian_happ_2017$launch_angle, na.rm = TRUE)
avg_la_2017
avg_la_2018 <- mean(ian_happ_2018$launch_angle, na.rm = TRUE)
avg_la_2019 <- mean(ian_happ_2019$launch_angle, na.rm = TRUE)
avg_la_2020 <- mean(ian_happ_2020$launch_angle, na.rm = TRUE)
avg_la_2021 <- mean(ian_happ_2021$launch_angle, na.rm = TRUE)
avg_la_2022 <- mean(ian_happ_2022$launch_angle, na.rm = TRUE)
# Calculate Happ's average exit velo last 5 seasons
ev_2017 <- mean(ian_happ_2017$launch_speed, na.rm = T)
ev_2018 <- mean(ian_happ_2018$launch_speed, na.rm = T)
ev_2019 <- mean(ian_happ_2019$launch_speed, na.rm = T)
ev_2020 <- mean(ian_happ_2020$launch_speed, na.rm = T)
ev_2021 <- mean(ian_happ_2021$launch_speed, na.rm = T)
ev_2022 <- mean(ian_happ_2022$launch_speed, na.rm = T)

Year <- c(2017, 2018, 2019, 2020, 2021, 2022)
Avg_LaunchAngle <- c(avg_la_2017, avg_la_2018, avg_la_2019, avg_la_2020,
                     avg_la_2021, avg_la_2022)
Avg_LaunchSpeed <- c(ev_2017, ev_2018, ev_2019, ev_2020, ev_2021, ev_2022)
Ian_Happ_LA_EV <- data.frame(Year, Avg_LaunchAngle, Avg_LaunchSpeed)
head(Ian_Happ_LA_EV)

# Create a table of avg launch angle/exit velo
Ian_Happ_LA_EV$Avg_LaunchAngle <- round(Ian_Happ_LA_EV$Avg_LaunchAngle, 2) 
Ian_Happ_LA_EV$Avg_LaunchSpeed <- round(Ian_Happ_LA_EV$Avg_LaunchSpeed, 2)
Ian_Happ_LA_EV %>%
  gt() %>%
  gt_theme_538() %>%
  tab_header(
    title = md("**Ian Happ's Career Averages"),
    subtitle = md("Launch Angle & Exit Velocity")) %>%
  cols_label(
    Year = "Year",
    Avg_LaunchAngle = "Avg Launch Angle",
    Avg_LaunchSpeed = "Avg Launch Speed"
  )

# Compare Happ's 2022 avgs with total MLB
total_mlb2022 <- statcast_search(start_date = "2022-04-01",
                                 end_date = "2022-09-18",
                                 player_type = 'batter')
View(total_mlb2022)
traceback()
