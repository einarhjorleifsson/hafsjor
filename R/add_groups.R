#' Add basebap
#'
#' @param map a map widget object created from leaflet
#' @param tiles What layers - NOT YET ACTIVE
#'
#' @return
#' @export
#'
#' @examples
hs_add_base <- function(map, tiles) {
  map |>
  addTiles(urlTemplate = "https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}",
         attribution = 'Data source: <a href="https://www.hafogvatn.is">Marine & Freshwater Research Institute</a>',
         group = "Hnöttur") |>
  addTiles(urlTemplate = "https://heima.hafro.is/~einarhj/tiles/haf/050m/{z}/{x}/{-y}.png",
           group = "Botnlag",
           options = tileOptions(minZoom = 5, maxZoom = 16)) |>
  addTiles(urlTemplate = "https://heima.hafro.is/~einarhj/tiles/haf/020m/{z}/{x}/{-y}.png",
           group = "Botnlag",
           options = tileOptions(minZoom = 5, maxZoom = 16)) |>
  addTiles(urlTemplate = "https://heima.hafro.is/~einarhj/tiles/lhg/{z}/{x}/{-y}.png",
           group = "Botnlag",
           options = tileOptions(minZoom = 0, maxZoom = 16)) |>
  addTiles(urlTemplate = "https://heima.hafro.is/~einarhj/tiles/vestfirdir_dpi/{z}/{x}/{-y}.png",
           group = "Botnlag",
           options = tileOptions(minZoom = 0, maxZoom = 16))
}


hs_add_veidar <- function(map) {
  map |>
    addWMSTiles(baseUrl = "https://gis.hafogvatn.is/geoserver/hafro/wms",
                layers = "hafro:trawl_3857_byte",
                group = "Fish trawl",
                options = WMSTileOptions(format = "image/png",
                                         transparent  = TRUE,
                                         crs = "EPSG:3057",
                                         opacity = 1)) |>
    addWMSTiles(baseUrl = "https://gis.hafogvatn.is/geoserver/hafro/wms",
                layers = "hafro:shrimp_3857_byte",
                group = "Shrimp trawl",
                options = WMSTileOptions(format = "image/png",
                                         transparent  = TRUE,
                                         #crs = "EPSG:3057",
                                         opacity = 1)) |>
    addWMSTiles(baseUrl = "https://gis.hafogvatn.is/geoserver/hafro/wms",
                layers = "hafro:nephrops_3857_byte",
                group = "Nephrops trawl",
                options = WMSTileOptions(format = "image/png",
                                         transparent  = TRUE,
                                         crs = "EPSG:3057",
                                         opacity = 1)) |>
    addWMSTiles(baseUrl = "https://gis.hafogvatn.is/geoserver/hafro/wms",
                layers = "hafro:longline_3857_byte",
                group = "Longline",
                options = WMSTileOptions(format = "image/png",
                                         transparent  = TRUE,
                                         crs = "EPSG:3057",
                                         opacity = 1))
}

hs_add_log <- function(map) {
  map |>
    addWMSTiles(baseUrl = "https://gis.lmi.is/geoserver/wms",
                layers = "LHG:landhelgi_12_milur_lina",
                group = "12 mílur",
                options = WMSTileOptions(format = "image/png",
                                         transparent  = TRUE,
                                         crs = "EPSG:3057",
                                         opacity = 1)) |>
    addWMSTiles(baseUrl = "https://gis.lmi.is/geoserver/wms",
                layers = "LHG:efnahagslogsaga_lina",
                group = "EEZ",
                options = WMSTileOptions(format = "image/png",
                                         transparent  = TRUE,
                                         crs = "EPSG:3057",
                                         opacity = 1))

}

hs_add_lifriki <- function(map) {
 map |>
    leaflet.extras2::addWMS(baseUrl = "https://hafsja-geoserver.dev.hafogvatn.cloud/geoserver/wms",
           layers = "test:sample_species_lines_v",
           group = "Botndýr",
           popupOptions = popupOptions(maxWidth = 600),
           checkempty = TRUE,
           options = WMSTileOptions(
             transparent = TRUE,
             format = "image/png",
             info_format = "text/html",
             tiled = TRUE))
}
