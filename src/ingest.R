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
names(state) <- c('state_name', 'region_name', 'state_code')
state$state_name <- str_to_lower(state$state_name)
state$region_name <- str_to_lower(state$region_name)
# clgeo_IsValid(state)
saveRDS(state, 'data/brazil_state.rds')
names(state) <- c('state_nm', 'region_nm', 'state_cd')
writeOGR(state, 'data/brazil_state.shp', 'state', overwrite_layer = TRUE, driver = 'ESRI Shapefile')


# meso
meso <- readOGR('data/source/BRMEE250GC_SIR.shp', verbose = FALSE)
names(meso) <- c('meso_name', 'meso_code')
meso$meso_name <- str_to_lower(meso$meso_name)
# clgeo_IsValid(meso)
saveRDS(meso, 'data/brazil_meso.rds')
names(meso) <- c('meso_nm', 'meso_cd')
writeOGR(meso, 'data/brazil_meso.shp', 'meso', overwrite_layer = TRUE, driver = 'ESRI Shapefile')


# micro
micro <- readOGR('data/source/BRMIE250GC_SIR.shp', verbose = FALSE)
names(micro) <- c('micro_name', 'micro_code')
micro$micro_name <- str_to_lower(micro$micro_name)
# clgeo_IsValid(micro)
saveRDS(micro, 'data/brazil_micro.rds')
names(micro) <- c('micro_nm', 'micro_cd')
writeOGR(micro, 'data/brazil_micro.shp', 'micro', overwrite_layer = TRUE, driver = 'ESRI Shapefile')


# muni
muni <- readOGR('data/source/BRMUE250GC_SIR.shp', verbose = FALSE)
names(muni) <- c('muni_name', 'muni_code')
muni$muni_name <- str_to_lower(muni$muni_name)
# clgeo_IsValid(muni)
saveRDS(muni, 'data/brazil_muni.rds')
names(muni) <- c('muni_nm', 'muni_cd')
writeOGR(muni, 'data/brazil_muni.shp', 'muni', overwrite_layer = TRUE, driver = 'ESRI Shapefile')




