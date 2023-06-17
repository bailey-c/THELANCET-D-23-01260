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
ct_lineage_plot <- data.table::fread("../data/suppl2d_table.tsv")

ct_lineage_plot <- ggplot(crick_lineage_ct, aes(y = ct, x = lineage_clean, colour = lineage_clean)) + 
  geom_boxplot(width=0.4) + 
  geom_jitter(alpha = 0.2, width = 0.2) +
  stat_summary(fun=median, geom="point", size=2) + 
  xlab("") +
  ylab("Ct values") +
  scale_colour_manual(values = mycols[c(2:4,7)]) + 
  scale_x_discrete(labels=c("B.1.1.7 (Alpha)" = "B.1.1.7 (Alpha) \n n = 111" , 
                            "B.1.617.2 (Delta)" = "B.1.617.2 (Delta) \n n = 112",
                            "BA.1 (Omicron)" = "BA.1 (Omicron) \n n = 155",
                            "BA.2 (Omicron)" = "BA.2 (Omicron) \n n = 102")) +
  theme_minimal() +
  theme(axis.text.x = element_blank(),
        axis.ticks.x = element_blank()) +
  theme_bauer() +
  theme(        axis.title.y = element_text(face = "bold", size = 14),
                axis.text.y = element_text(face = "bold", size = 14, colour = "black"),
                axis.text.x = element_text(face = "bold", size = 14, colour = "black"),
                axis.title.x = element_text(face = "bold", size = 14),
                legend.text = element_text(face = "bold", size = 14)) +
  scale_y_reverse()

ct_lineage_plot
