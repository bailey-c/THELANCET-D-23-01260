
#Lineage plot script
#Author: C.Bailey
#Date finalised: 01/06/23
#Figure 1F

#Set dependencies------
pacman::p_load(khroma, 
               data.table, 
               dplyr, 
               ggplot2)

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

#load functions------
theme_bauer <- function (...) {
  theme_bw() +
    theme(legend.position="none") +
    theme(axis.text.x = element_text(angle = 45, hjust = 1, size=12)) + 
    theme(axis.text.y = element_text(size=12))  + 
    theme(
      panel.grid.major.x = element_blank(),
      panel.grid.minor.x = element_blank(),
      axis.title.y=element_text(size=15),
      axis.title.x=element_blank(),
      strip.text = element_text(size=12),
      strip.background = element_blank(),
      ...
    )
  
}


#Set colour palette------
muted <- colour("muted")
okabeito <- colour("okabeito")
plot_scheme(okabeito(8), colours = TRUE, names = TRUE, size = 0.9)

mycols <- okabeito(8)[1:8] %>% as.data.frame()
mycols <- mycols$.

#Load dataset------
earliest_date <- data.table::fread("../data/figure1f_table.tsv")

#Create plot------
lead_time_plot <- ggplot(earliest_date, aes(y = lead_time, x = lineage_clean, 
                                            fill = lineage_clean,
                                            colour = lineage_clean)) + 
  scale_colour_manual(values = mycols[c(2,6,4)]) +
  scale_fill_manual(values = mycols[c(2,6,4)]) +
  xlab("") + ylab("Lead time (days)") +
  scale_x_discrete(limits=rev) +
  geom_col(width = 0.1) + 
  geom_point(size = 18, shape = 21) +
  coord_flip() + 
  theme_bauer() +
  geom_hline(aes(yintercept = 0)) +
  theme(axis.title.x = element_text(size = 15),
        axis.text.y = element_text(size = 15, colour = "black"),
        axis.text.x = element_text(size = 15, colour = "black"))

lead_time_plot
