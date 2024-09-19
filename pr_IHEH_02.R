# load packages
library(prioritizr) # package for conservation planning
library(terra)      # package for working with raster data
library(sf)         # package for working with vector data
library(highs)      # package provides HiGHS solver

# import planning unit data
pu_data <- read_sf("DATOS/ZS_BNT_IHEH_To.gpkg")

# definir unidades de costos segun IHEH
pu_data$precio <- as.integer(pu_data$IHEH_mean)

# import elevation data
dem_data <- rast("DATOS/DEM_combinado.tif")
# ajustar valores de bandas a 1
dem_data <- dem_data/dem_data

# definir valores de AP y PnP como booleanos
pu_data$RUNAP_l <- as.logical(pu_data$RUNAP)
pu_data$Par_noP_l <- as.logical(pu_data$Paramo_noP)

# Planteamiento del problema de optimizacion
p1 <-
  problem(pu_data, dem_data, cost_column = "precio") %>%
  add_min_set_objective() %>%
  add_relative_targets(0.01) %>%
  add_locked_in_constraints("Par_noP_l") %>%
  add_locked_out_constraints("RUNAP_l") %>%
  add_binary_decisions() %>%
  add_highs_solver(verbose = FALSE)

# Solucion del problema definido
s1 <- solve(p1)
plot(s1[, "solution_1"], pal = c("grey90", "darkgreen"), main='solution IHEH con restricciones')
# calculate number of planning units selected in the prioritization
sum(s1$solution_1)
# calculate total cost of the prioritization
sum(s1$solution_1 * s1$precio)

st_write(s1[, "solution_1"], dsn="PRIORIZ_GPKG/pr_IHEH_02.gpkg")
