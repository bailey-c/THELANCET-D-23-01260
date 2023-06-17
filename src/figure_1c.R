
#Lineage plot script
#Author: C.Bailey
#Date finalised: 01/06/23
#Figure 1C

#Set dependencies------
pacman::p_load(khroma, 
               data.table, 
               dplyr, 
               ggplot2)

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

#Load dataset------
incidence_all  <- data.table::fread("../data/figure1c_table.tsv")

#Create plot------
incidence_all_plot <- incidence_all %>% ggplot2::ggplot(aes(x = date, 
                                     y = rolling_7day_incidence, 
                                     color = rolling_mean_key,
                                     fill = rolling_mean_key)) +
  ggplot2::geom_col(aes(y = incidence), alpha = 0.1) +
  ggplot2::geom_line(colour = 'dark blue') +
  #ggplot2::geom_area(aes(alpha = 0.1), position = "identity", colour = 'dark blue') +
  ggplot2::labs(y = "Rolling 7 day incidence per 1000 tests", 
                color = "Metric",
                x = "") +
  scale_y_continuous(breaks=c(0, 0.25, 0.5, 0.75), limits = c(0,0.75), labels = c(0,250,500,750)) +
  theme_bauer() +
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.border = element_blank(),
        panel.background = element_blank(),
        axis.text.y = element_text(face = "bold", size = 12),
        axis.line = element_line(colour = "black"),
        axis.ticks.y = element_blank(),
        legend.title = element_blank(),
        axis.title.y = element_text(face = "bold", size = 12),
        axis.text.x = element_text(face = "bold", size = 12),
        axis.title.x = element_text(face = "bold", size = 12),
        legend.text = element_text(face = "bold", size = 12),
        strip.text.y = element_blank()) +
  scale_fill_manual(values = c("#3895D3", "#900D09"),
                    labels = c("Incidence (7 day)", "Daily Incidence")) +
  scale_colour_manual(values = c("#3895D3", "#900D09")) + 
  guides(colour = "none", alpha = "none", fill = "none")

incidence_all_plot
