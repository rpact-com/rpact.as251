
# pkgbuild
rpact.dev::buildPackage(packageName = "rpact.as251", 
    packagePath = "D:/R/workspace/rpact.as251",
    targetBaseDirectory = "D:/R/rpact_version",
    binary = TRUE,
    release = FALSE,
    cCodeIncluded = TRUE, 
    roxygenEnabled = TRUE,
    vignetteBuildingEnabled = FALSE,
    installPackage = TRUE)

#setwd("D:/R/workspace/rpact.as251")
#pkgbuild::check_build_tools(debug = TRUE)

library(rpact.as251)
