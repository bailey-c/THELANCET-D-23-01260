#Lineage plot script
#Author: C.Bailey
#Date finalised: 01/06/23
#Figure supplement 2B

#Set dependencies------
pacman::p_load(khroma, 
               data.table, 
               dplyr, 
               ggplot2,
               extrafont)

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

#Set palette------
okabeito <- colour("okabeito")
mycols <- okabeito(8)
mycols[1:8]


#Load dataset------
suppl2b_table <- data.table::fread("../data/suppl2b_table.tsv")

suppl2b_table$year <- as.character(suppl2b_table$year)

suppl2b_plot <- 
  ggplot(suppl2b_table, aes(y=prop_peak, x=date, fill = year, colour = year)) + 
  scale_color_manual(values = mycols.df$mycols[c(4,7,6)]) +
  scale_fill_manual(values = mycols.df$mycols[c(4,7,6)])+
  geom_col(width = 1) + ylab("Building attendance \n (proportion of peak)") +
  xlab("Date") + theme(legend.position = "top") + theme_bauer() +
  theme(legend.position = "top",
        legend.text = element_text(colour = "black", size = 14, face = "bold"),
        legend.title = element_blank(),
        axis.text.x = element_text(colour = "black", size = 14, angle = 0, hjust = 0.5, vjust = 0),
        axis.text.y = element_text(colour = "black", size = 14, face = "bold"),
        axis.title.y = element_text(colour = "black", size = 14, face = "bold")) +
  geom_hline(yintercept = 0.6, colour = "black", linetype = 'dotted') +
  geom_hline(yintercept = 0.75, colour = "red", linetype = 'dotted')

suppl2b_plot

