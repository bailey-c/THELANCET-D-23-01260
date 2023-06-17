#Lineage plot script
#Author: C.Bailey
#Date finalised: 01/06/23
#Figure 1B

#Set dependencies------
pacman::p_load(khroma, 
               data.table, 
               dplyr, 
               ggplot2)

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

#Load dataset------
figure1b_table <- data.table::fread("../data/figure1b_table.tsv")

figure1b_plot <- ggplot(figure1b_table, aes(y=count, x=date, fill = pos_neg, colour = pos_neg)) + 
  geom_col() +
  scale_colour_manual(values = c("#009E73", "#E69F00"), labels = c("Negative", "Positive")) +
  scale_fill_manual(values = c("#009E73", "#E69F00"), labels = c("Negative", "Positive")) +
  ylab("PCR tests") +
  xlab("Date") +
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.border = element_blank(),
        panel.background = element_blank(),
        axis.text.y = element_text(face = "bold", size = 14),
        axis.line = element_line(colour = "black"),
        axis.ticks.y = element_blank(),
        legend.title = element_blank(),
        axis.title.y = element_text(face = "bold", size = 14),
        axis.text.x = element_text(face = "bold", size = 14),
        axis.title.x = element_text(face = "bold", size = 14),
        legend.text = element_text(face = "bold", size = 14),
        legend.position = "right",
        strip.text.y = element_blank()) 

figure1b_plot
