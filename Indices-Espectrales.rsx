##UASB=group
##Indices Espectrales=name
##BLUE=raster
##GREEN=raster
##RED=raster
##NIR=raster
##SWIR1=raster
##SWIR2=raster
##output_NDVI=output raster
##output_EVI=output raster
##output_NDWI=output raster
##output_SAVI=output raster
##output_NBRI=output raster
##output_NDSI=output raster

# Load required library
library(raster)

# Ensure all input rasters are loaded correctly
blue <- BLUE
green <- GREEN
red <- RED
nir <- NIR
swir1 <- SWIR1
swir2 <- SWIR2

# Calculate NDVI: (NIR - RED) / (NIR + RED)
output_NDVI <- (nir - red) / (nir + red)

# Calculate EVI: G * (NIR - RED) / (NIR + C1 * RED - C2 * BLUE + L)
C1 <- 6
C2 <- 7.5
L <- 1
G <- 2.5
output_EVI <- G * (nir - red) / (nir + C1 * red - C2 * blue + L)

# Calculate NDWI: (GREEN - NIR) / (GREEN + NIR)
output_NDWI <- (green - nir) / (green + nir)

# Calculate SAVI: ((NIR - RED) / (NIR + RED + L)) * (1 + L)
L_savi <- 0.5
output_SAVI <- ((nir - red) / (nir + red + L_savi)) * (1 + L_savi)

# Calculate NBRI: (NIR - SWIR2) / (NIR + SWIR2)
output_NBRI <- (nir - swir2) / (nir + swir2)

# Calculate NDSI: (GREEN - SWIR1) / (GREEN + SWIR1)
output_NDSI <- (green - swir1) / (green + swir1)