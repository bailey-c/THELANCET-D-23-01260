#Lineage plot script
#Author: C.Bailey
#Date finalised: 01/06/23
#Figure supplement 1B

#Set dependencies------
pacman::p_load(khroma, 
               data.table, 
               dplyr, 
               ggplot2,
               extrafont)

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

#Load dataset------
suppl1b_table <- data.table::fread("../data/suppl1b_table.tsv")

suppl1b_plot  <- suppl1b_table %>% ggplot2::ggplot(aes(x = date, y = rolling_7day_incidence * 1000, color = rolling_mean_key, fill = rolling_mean_key)) +
  ggplot2::geom_col(aes(y = incidence * 1000), alpha = 0.1) +
  ggplot2::geom_line(colour = 'dark blue') +
  ggplot2::geom_area(aes(alpha = 0.1), position = "identity", colour = 'dark blue') +
  ggplot2::labs(y = "Rolling 7 day incidence per 1000 tests", 
                color = "Metric",
                x = "Date") + facet_wrap(trust_short ~ ., ncol = 2) +
  scale_y_continuous(breaks=c(0, 500, 1000)) +
  theme_bauer() +
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.border = element_blank(),
        panel.background = element_blank(),
        axis.text.y = element_text(face = "bold", size = 10),
        axis.line = element_line(colour = "black"),
        axis.ticks.y = element_blank(),
        legend.title = element_blank(),
        axis.title.y = element_text(face = "bold", size = 16),
        axis.text.x = element_text(face = "bold", size = 10),
        legend.text = element_text(face = "bold", size = 10)) +
  scale_fill_manual(values = c("#3895D3", "#900D09"),
                    labels = c("Incidence (7 day)", "Daily Incidence")) +
  scale_colour_manual(values = c("#3895D3", "#900D09")) + 
  guides(colour = "none", alpha = "none", fill = "none")

suppl1b_plot
