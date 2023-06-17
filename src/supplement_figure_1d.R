#Lineage plot script
#Author: C.Bailey
#Date finalised: 01/06/23
#Figure supplement 1D

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

symp_asymp_plot <- ggplot(positive_pipeline_samples, aes(y = ct, x = asymptomatic_testing, colour = asymptomatic_testing)) + 
  geom_violin(alpha = 0.2, trim = FALSE) + 
  geom_boxplot(width=0.2, outlier.shape = NA) +
  xlab("") +
  ylab("Ct value") +
  scale_colour_manual(values = mycols[c(8,6)]) +
  theme_minimal()  +
  scale_x_discrete(labels=c("FALSE" = paste0("SYM (n = ", table(positive_pipeline_samples$asymptomatic_testing)[[1]], ")"), 
                            "TRUE" = paste0("ASYM (n = ", table(positive_pipeline_samples$asymptomatic_testing)[[2]], ")"))) + 
  theme_bw() + 
  theme(axis.text.x = element_text(face = "bold", size = 14),
        axis.ticks.x = element_blank(),
        axis.text.y = element_text(face = "bold", size = 14),
        axis.line = element_line(colour = "black"),
        axis.ticks.y = element_blank(),
        legend.title = element_blank(),
        axis.title.y = element_text(face = "bold", size = 14),
        axis.title.x = element_text(face = "bold", size = 14),
        legend.position = "none"
  ) +
  stat_summary(fun=median, geom="point", size=2, color="black") +
  scale_y_reverse() + ylim(45, 0) +
  stat_compare_means(comparisons = my_comparisons, label.y = c(-5), face = "bold")

symp_asymp_plot$layers[[4]]$aes_params$family <- "sans"

symp_asymp_plot
