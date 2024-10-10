library(leaflet)
# https://gis.hafogvatn.is/geoserver/hafro/wms
m <-
  leaflet() |>
  addTiles(group = "base") %>%
  setView(-20, 64, zoom = 7) |>
  addWMSTiles(baseUrl = "https://gis.hafogvatn.is/geoserver/hafro/wms",
              layers = "hafro:trawl_3857_byte",
              group = "Fish trawl",
              options = WMSTileOptions(format = "image/jpeg",
                                       transparent  = FALSE,
                                       crs = "EPSG:3057",
                                       opacity = 0.7
                                       )
              ) |>
  addLayersControl(baseGroups = c("base"),
                   overlayGroups = c("Fish trawl"),
                   options = layersControlOptions(collapsed = FALSE))
m

htmlwidgets::saveWidget(m, "test.html")
