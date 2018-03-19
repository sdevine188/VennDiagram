library(grid)
library(gridExtra)


# https://github.com/cran/VennDiagram/tree/master/R
# https://rstudio-pubs-static.s3.amazonaws.com/13301_6641d73cfac741a59c0a851feb99e98b.html

setwd("H:/R/vennDiagram")

# load venn functions
source("draw_single_venn.R")
source("draw_pairwise_venn.R")
source("draw_triple_venn.R")
source("find_cat_pos.R")
source("ell2poly.R")
source("ellipse.R")
source("find_dist.R")
source("find_cat_pos.R")
source("find_intersect.R")
source("adjust_venn.R")
source("rotate_venn_degrees.R")
source("decide_special_case.R")
source("draw_sp_case_scaled.R")
source("rotate.R")
source("draw_sp_case_preprocess.R")
source("rotate_sp.R")
source("draw_sp_case.R")

head(starwars)

human_count <- starwars %>% filter(species == "Human") %>% count() %>% pull(n)
human_count

tatooine_count <- starwars %>% filter(homeworld == "Tatooine") %>% count() %>% pull(n)
tatooine_count

human_tatooine_count <- starwars %>% filter(species == "Human", homeworld == "Tatooine") %>% count() %>% pull()
human_tatooine_count

blue_eyed_count <- starwars %>% filter(eye_color == "blue") %>% count() %>% pull()
blue_eyed_count

blue_eyed_human_count <- starwars %>% filter(species == "Human", eye_color == "blue") %>% count() %>% pull()
blue_eyed_human_count

blue_eyed_tatooine_count <- starwars %>% filter(eye_color == "blue", homeworld == "Tatooine") %>% count() %>% pull()
blue_eyed_tatooine_count

blue_eyed_human_tatooine_count <- starwars %>% filter(eye_color == "blue", homeworld == "Tatooine", species == "Human") %>% count() %>% pull()
blue_eyed_human_tatooine_count


# draw single venn
grid.newpage()
draw.single.venn(human_count, category = "Humans", lty = "blank", fill = "cornflower blue", 
                 alpha = 0.5)

# draw pairwise venn
grid.newpage()
draw.pairwise.venn(area1 = human_count, area2 = tatooine_count, cross.area = human_tatooine_count, 
                   category = c("Humans", "Tatooine homeworld"))
grid.newpage()
draw.pairwise.venn(area1 = human_count, area2 = tatooine_count, cross.area = human_tatooine_count, 
                   category = c("Humans", "Tatooine homeworld"), 
                   lty = rep("blank", 2), fill = c("light blue", "pink"), alpha = rep(0.5, 2), cat.pos = c(0, 0), cat.dist = rep(0.025, 2))

# draw triple venn
grid.newpage()
draw.triple.venn(area1 = human_count, area2 = tatooine_count, area3 = blue_eyed_count, 
                 n12 = human_tatooine_count, n23 = blue_eyed_tatooine_count, n13 = blue_eyed_human_count, 
                 n123 = blue_eyed_human_tatooine_count, category = c("human", "tatooine", "blue_eyed"), lty = "blank", 
                 fill = c("skyblue", "pink1", "mediumorchid"))












