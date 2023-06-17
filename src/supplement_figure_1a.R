#Lineage plot script
#Author: C.Bailey
#Date finalised: 01/06/23
#Figure supplement 1A

#Set dependencies------
pacman::p_load(khroma, 
               data.table, 
               dplyr, 
               ggplot2,
               ggpubr)

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

#Load dataset------
suppl1a1_table <- data.table::fread("../data/suppl1a1_table.tsv")
suppl1a2_table <- data.table::fread("../data/suppl1a2_table.tsv")

suppl1a1_plot <- suppl1a1_table %>% 
  ggplot2::ggplot(aes(x = date,
                      y = rolling_7day_incidence,
                      fill = trust_short)) +
  ggplot2::geom_col() +
  ggplot2::labs(y = "Daily Infections", 
                fill = "",
                x = "Date") +
  scale_y_continuous(breaks=c(0, 50, 100, 150)) +
  annotate("rect", xmin = as.Date("2020-12-25"), xmax = as.Date("2020-12-28"), ymin = 0, ymax = 160, 
           alpha = .5) +
  theme_bauer() +
  theme(legend.position="top") + 
  scale_fill_manual(values = c("#CC79A7", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#000000", "#0072B2", "#D55E00"))


suppl1a2_plot <- suppl1a2_table %>% 
  ggplot2::ggplot(aes(x = date,
                      y = rolling_7day_incidence,
                      colour = trust_short)) +
  ggplot2::geom_line(size = 1) +
  ggplot2::labs(y = "Daily Tests", 
                color = "",
                x = "Date") +
  scale_y_continuous(breaks=c(0, 500, 1000)) +
  annotate("rect", xmin = as.Date("2020-12-24"), xmax = as.Date("2020-12-27"), ymin = 0, ymax = 1000, 
           alpha = .5) +
  #annotate("text", x= as.Date("2020-12-26"), y=1100, size = 3, label = "no reports \n 25-28/12/20") + 
  theme_bauer() +
  theme(legend.position="top",
        axis.ticks.x = element_blank()) + 
  scale_colour_manual(values = c("#CC79A7", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#000000", "#0072B2", "#D55E00"))

suppl1a2_plot <- suppl1a2_plot + theme(axis.text.x = element_blank())
suppl1a1_plot <- suppl1a1_plot+ theme(axis.text.x = element_text(angle = 0, hjust = 0.5))

suppl1a_plot <- ggarrange(suppl1a2_plot, suppl1a1_plot, common.legend =  T, nrow = 2, align = "v")

suppl1a_plot
