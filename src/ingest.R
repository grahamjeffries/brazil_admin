#
# Download and format Brazilian administrative data
#

package_list <- c('cleangeo', 'rgdal', 'stringr')
pacman::p_load(char = package_list)

dl_link <- 'ftp://geoftp.ibge.gov.br/organizacao_do_territorio/malhas_territoriais/malhas_municipais/municipio_2015/Brasil/BR/BR.zip'

dl_path <- 'data/source/brazil_admin.zip'
download.file(dl_link, dl_path)

unzip_list <- unzip(dl_path, exdir = 'data/source/', junkpaths = TRUE)

# state
state <- readOGR('data/source/BRUFE250GC_SIR.shp', verbose = FALSE)
names(state) <- c('state_nm', 'region_nm', 'state_cd')
state$state_nm <- str_to_lower(state$state_nm)
state$region_nm <- str_to_lower(state$region_nm)
# clgeo_IsValid(state)
writeOGR(state, 'data/brazil_state.shp', 'state', overwrite_layer = TRUE, driver = 'ESRI Shapefile')
saveRDS(state, 'data/brazil_state.rds')

# meso
meso <- readOGR('data/source/BRMEE250GC_SIR.shp', verbose = FALSE)
names(meso) <- c('meso_nm', 'meso_cd')
meso$meso_nm <- str_to_lower(meso$meso_nm)
# clgeo_IsValid(meso)
writeOGR(meso, 'data/brazil_meso.shp', 'meso', overwrite_layer = TRUE, driver = 'ESRI Shapefile')
saveRDS(meso, 'data/brazil_meso.rds')

# micro
micro <- readOGR('data/source/BRMIE250GC_SIR.shp', verbose = FALSE)
names(micro) <- c('micro_nm', 'micro_cd')
micro$micro_nm <- str_to_lower(micro$micro_nm)
# clgeo_IsValid(micro)
writeOGR(micro, 'data/brazil_micro.shp', 'micro', overwrite_layer = TRUE, driver = 'ESRI Shapefile')
saveRDS(micro, 'data/brazil_micro.rds')

# muni
muni <- readOGR('data/source/BRMUE250GC_SIR.shp', verbose = FALSE)
names(muni) <- c('muni_nm', 'muni_cd')
muni$muni_nm <- str_to_lower(muni$muni_nm)
# clgeo_IsValid(muni)
writeOGR(muni, 'data/brazil_muni.shp', 'muni', overwrite_layer = TRUE, driver = 'ESRI Shapefile')
saveRDS(muni, 'data/brazil_muni.rds')
