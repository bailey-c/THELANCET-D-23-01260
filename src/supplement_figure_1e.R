#Lineage plot script
#Author: C.Bailey
#Date finalised: 01/06/23
#Figure supplement 1E

#Set dependencies------
pacman::p_load(khroma, 
               data.table, 
               dplyr, 
               ggplot2,
               extrafont)

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

muted <- colour("muted")
okabeito <- colour("okabeito")
plot_scheme(okabeito(8), colours = TRUE, names = TRUE, size = 0.9)

mycols <- okabeito(8)[1:8] %>% as.data.frame()
mycols <- mycols$.



#Load dataset------
positive_pipeline_samples <- data.table::fread("../data/suppl1d_table.tsv")

my_comparisons <- list( c("TRUE", "FALSE"))


cumulative_occurrence_plot <- ggplot(positive_pipeline_samples %>% filter(ct < 15), aes(x = ct, colour = asymptomatic_testing)) +
  stat_ecdf(geom = "step", size = 2) +
  xlab("Ct value") + ylab("Cumulative occurence") +
  scale_colour_manual(labels = c("SYM", "ASYM"), values = mycols[c(8,6)]) +
  theme_minimal() + 
  theme_bw() +
  theme(axis.text.x = element_text(face = "bold", size = 14),
        axis.ticks.x = element_blank(),
        axis.text.y = element_text(face = "bold", size = 14),
        axis.line = element_line(colour = "black"),
        axis.ticks.y = element_blank(),
        legend.title = element_blank(),
        axis.title.y = element_text(face = "bold", size = 14),
        axis.title.x = element_text(face = "bold", size = 14),
        legend.position="top")


cumulative_occurrence_plot
