#Lineage plot script
#Author: C.Bailey
#Date finalised: 01/06/23
#Figure supplement 2D

#Set dependencies------
pacman::p_load(khroma, 
               data.table, 
               dplyr, 
               ggplot2,
               extrafont)

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))


#Set colour palette------
mycols <- c("#882255", "#117733", "#DDCC77", "#88CCEE", "#44AA99")

#Load dataset------
irr_plot <- data.table::fread("../data/suppl1c_table.tsv")

irr_plot <- irr_plot %>% ggplot2::ggplot(aes(x = date, y = rolling_14day_incidence, color = site_type, fill = site_type)) +
  ggplot2::geom_line(size = 1) +
  ggplot2::labs(title = "", 
                y = "IRR", 
                color = "",
                x = "Date") +
  scale_y_continuous(breaks=c(0, 5, 10, 15, 20)) +
  theme_bw() +
  theme(legend.position="top",
        axis.title.y = element_text(face = "bold", size = 12),
        axis.text.x = element_text(face = "bold", size = 12, colour = "black"),
        axis.title.x = element_text(face = "bold", size = 12),
        legend.text = element_text(face = "bold", size = 12),
        axis.text.y = element_text(face = "bold", size = 12, colour = "black")) + 
  scale_color_manual(values = c("#0072B2", "#009E73", "#D55E00"))

irr_plot
