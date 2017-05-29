==========================================================================
Scripts to reproduce FlowSOM time course analysis in Collier et al. 
==========================================================================

Before performing analysis, QC needs to be performed on the flow cytometry data. We recommend using `flowAI <https://www.bioconductor.org/packages/release/bioc/html/flowAI.html>`_ with the automatic method (always check the output makes sense).

`resQC <- flow_auto_qc(fcsfiles)`

After QC, compensation was performed using FlowJO. Dead cells and doublets were excluded and the final compensated data was exported. (FCS files can alternatively be compensated in R)

An example data set is provided in `/data` which includes subset of a 10 day Naive to Primed conversion experiments.  


#. Collier, A., Panula, S., Schell, J., Chovanec, P., Reyes, A., Petropoulos, S., Corcoran, A., Walker, R., Douagi, I., Lanner, F., et al. (2017). Comprehensive Cell Surface Protein Profiling Identifies Specific Markers of Human Naive and Primed Pluripotent States. Cell Stem Cell.

#. Gassen, S., Callebaut, B., Helden, M., Lambrecht, B., Demeester, P., Dhaene, T., and Saeys, Y. (2015). FlowSOM: Using self‐organizing maps for visualization and interpretation of cytometry data. Cytom Part A 87, 636–645.


