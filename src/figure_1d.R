
#Lineage plot script
#Author: C.Bailey
#Date finalised: 01/06/23
#Figure 1D

#Set dependencies------
pacman::p_load(khroma, 
               data.table, 
               dplyr, 
               ggplot2)

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))


#Set colour palette------
okabeito <- colour("okabeito")
mycols <- okabeito(8)
mycols[1:8]

bright <- colour("bright")
plot_scheme(bright(7), colours = TRUE)
plot_scheme(okabeito(8), colours = TRUE)

mycols_2 <- bright(7)

mycols <- c(mycols, mycols_2)

cols.df <- data.table(c(mycols[c(2,3,4,15,7,5)], "#B53737", mycols[c(9, 8)],"#03AC13", mycols[c(12:16)]))


#Load dataset------
lineage_rtpcr_results <- data.table::fread("../data/cog_id_table.tsv")
lineage_rtpcr_results$Month_Yr <- format(as.Date(lineage_rtpcr_results$sample_date), "%Y-%m")

final_lineages <- lineage_rtpcr_results[, .N, by = c("plot_category", "Month_Yr")]
numbers_per_month <- lineage_rtpcr_results[ , .N, by = c("Month_Yr")] %>% dplyr::rename(total = N)
final_lineages <- full_join(final_lineages, numbers_per_month) %>% 
  filter(!is.na(Month_Yr))

final_lineages <- final_lineages %>% mutate(N = as.numeric(N)) %>% mutate(total = as.numeric(total))


#Create plot------
lineage_plot <- ggplot(final_lineages, aes(x = Month_Yr, y = N/total, fill = plot_category)) + 
  geom_col(size=1, col = "black") + 
  scale_colour_manual(values = c("black")) +
  scale_fill_manual(values = cols.df$V1) +
  ylab("Proportion of cases") + xlab("") +
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.border = element_blank(),
        panel.background = element_blank(),
        axis.text.y = element_text(face = "bold", size = 14, colour = "black"),
        axis.line = element_line(colour = "black"),
        axis.ticks.y = element_blank(),
        legend.title = element_blank(),
        axis.title.y = element_text(face = "bold", size = 14, colour = "black"),
        axis.text.x = element_text(face = "bold", size = 14, angle = 90, vjust = 0.5, colour = "black"),
        axis.title.x = element_text(face = "bold", size = 14, colour = "black"),
        legend.text = element_text(face = "bold", size = 14),
        legend.position = "top", legend.box = "horizontal",
        strip.text.y = element_blank())  +
  guides(colour = "none") + guides(col = guide_legend(ncol = 20))

lineage_plot





