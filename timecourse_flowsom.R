require(FlowSOM)
require(flowCore)


setwd("/media/chovanec/My_Passport/mandy_flow/Collier et al./")



DAY10 <- flowCore::read.FCS("data/export_Day10.fcs", transformation = FALSE)
DAY10_expr <- flowCore::exprs(DAY10)
DAY2 <- flowCore::read.FCS("data/export_Day2.fcs", transformation = FALSE)
DAY2_expr <- flowCore::exprs(DAY2)
DAY4 <- flowCore::read.FCS("data/export_Day4.fcs", transformation = FALSE)
DAY4_expr <- flowCore::exprs(DAY4)
DAY6 <- flowCore::read.FCS("data/export_Day6.fcs", transformation = FALSE)
DAY6_expr <- flowCore::exprs(DAY6)
DAY8 <- flowCore::read.FCS("data/export_Day8.fcs", transformation = FALSE)
DAY8_expr <- flowCore::exprs(DAY8)
Primed <- flowCore::read.FCS("data/export_Primed.fcs", transformation = FALSE)
Primed_expr <- flowCore::exprs(Primed)
Naive <- flowCore::read.FCS("data/export_Naive.fcs", transformation = FALSE)
Naive_expr <- flowCore::exprs(Naive)

########################
### FlowSOM analysis ###
########################


file_names <- list(Primed="data/export_Primed.fcs",
                      DAY2="data/export_Day2.fcs", 
                      DAY4="data/export_Day4.fcs",
                      DAY6="data/export_Day6.fcs",
                      DAY8="data/export_Day8.fcs",
                      DAY10="data/export_Day10.fcs",
                      Naive="data/export_Naive.fcs")


set.seed(3)
out_fSOM <- ReadInput(unlist(file_names), compensate = FALSE, transform = TRUE, scale = TRUE, toTransform = c(7,8,9,10,11,12))
#Excluding GFP 7AAD
out_fSOM <- BuildSOM(out_fSOM,colsToUse = c(7,8,9,10,11,12), xdim = 10, ydim = 10) 
# grid size (e.g. 10x10 or 20x20 grid, i.e. 100 or 400 clusters)

#Building the minimal spanning tree
out_fSOM <- BuildMST(out_fSOM, tSNE=FALSE)

PlotStars(out_fSOM)


manual <- factor(unlist(list(rep("Primed",nrow(Primed_expr)), rep("DAY2",nrow(DAY2_expr)), rep("DAY4",nrow(DAY4_expr)),
                             rep("DAY6",nrow(DAY6_expr)), rep("DAY8",nrow(DAY8_expr)), rep("DAY10",nrow(DAY10_expr)), 
                             rep("Naive",nrow(Naive_expr)))), levels = c("Primed", "DAY2", "DAY4", "DAY6", "DAY8", "DAY10", "Naive"))



PlotPies(out_fSOM,cellTypes=manual, view = "MST")


pdf("results/timecourse.pdf",paper='A4')
PlotPies(out_fSOM,cellTypes=manual, view = "MST")
PlotMarker(out_fSOM, marker = "FJComp-379_28 355nm-A", main = "CD90")
PlotMarker(out_fSOM, marker = "FJComp-450_50 405nm-A", main = "CD57")
PlotMarker(out_fSOM, marker = "FJComp-585_15 561nm-A", main = "CD130")
PlotMarker(out_fSOM, marker = "FJComp-610_20 561nm-A", main = "CD77")
PlotMarker(out_fSOM, marker = "FJComp-670_14 640nm-A", main = "CD75")
PlotMarker(out_fSOM, marker = "FJComp-780_60 561nm-A", main = "CD7")
dev.off()

