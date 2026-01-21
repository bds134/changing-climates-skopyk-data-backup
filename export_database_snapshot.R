# Export Ecocrisis Database Snapshot for Dumbarton Oaks Paper
# Date: 2026-01-21
# Purpose: Preserve specific query results used in the analysis

library(DBI)
library(RPostgres)

# Establish connection
# NOTE: Database credentials and connection details have been removed for security
# To run this script, you need:
# 1. Access credentials to the Ecocrisis database
# 2. Database host and connection information
# Contact the Ecocrisis project administrators at ecocrisis.net for access
con <- DBI::dbConnect(
  RPostgres::Postgres(),
  host = Sys.getenv("ECOCRISIS_HOST"),
  port = as.integer(Sys.getenv("ECOCRISIS_PORT")),
  dbname = Sys.getenv("ECOCRISIS_DBNAME"),
  user = Sys.getenv("ECOCRISIS_USER"),
  password = Sys.getenv("ECOCRISIS_PASSWORD")
)

# Export approved events (main dataset)
events <- DBI::dbGetQuery(con, "
  SELECT * FROM eventinfo 
  WHERE approved = 'yes'
  ORDER BY start_year, id
")
write.csv(events, "data_backup/eventinfo_approved_2026_01_21.csv", row.names = FALSE)
cat("Exported", nrow(events), "approved events\n")

# Export event geographic locations
event_geo <- DBI::dbGetQuery(con, "
  SELECT * FROM event_geo_location
  ORDER BY event_id
")
write.csv(event_geo, "data_backup/event_geo_location_2026_01_21.csv", row.names = FALSE)
cat("Exported", nrow(event_geo), "event geographic locations\n")

# Export MXDA climate data
mxda <- DBI::dbGetQuery(con, "
  SELECT * FROM mxda_data
  ORDER BY sourceid, year
")
write.csv(mxda, "data_backup/mxda_data_2026_01_21.csv", row.names = FALSE)
cat("Exported", nrow(mxda), "MXDA climate records\n")

# Export regional event summary (Mexico City region)
mx_events <- DBI::dbGetQuery(con, "
  SELECT e.*, egl.state, egl.nearest_grid_id
  FROM eventinfo AS e
  JOIN event_geo_location AS egl ON e.id = egl.event_id
  WHERE e.approved = 'yes'
    AND e.start_year BETWEEN 1578 AND 1706
    AND egl.state IN ('Ciudad de México', 'México')
  ORDER BY e.start_year
")
write.csv(mx_events, "data_backup/mx_region_events_2026_01_21.csv", row.names = FALSE)
cat("Exported", nrow(mx_events), "Mexico City region events\n")

# Export regional event summary (Bajío)
bajio_events <- DBI::dbGetQuery(con, "
  SELECT e.*, egl.state, egl.nearest_grid_id
  FROM eventinfo AS e
  JOIN event_geo_location AS egl ON e.id = egl.event_id
  WHERE e.approved = 'yes'
    AND e.start_year BETWEEN 1578 AND 1706
    AND egl.state IN ('Guanajuato', 'Querétaro')
  ORDER BY e.start_year
")
write.csv(bajio_events, "data_backup/bajio_region_events_2026_01_21.csv", row.names = FALSE)
cat("Exported", nrow(bajio_events), "Bajío region events\n")

# Export regional event summary (Puebla-Tlaxcala)
pbtx_events <- DBI::dbGetQuery(con, "
  SELECT e.*, egl.state, egl.nearest_grid_id
  FROM eventinfo AS e
  JOIN event_geo_location AS egl ON e.id = egl.event_id
  WHERE e.approved = 'yes'
    AND e.start_year BETWEEN 1578 AND 1706
    AND egl.state IN ('Puebla', 'Tlaxcala')
  ORDER BY e.start_year
")
write.csv(pbtx_events, "data_backup/pbtx_region_events_2026_01_21.csv", row.names = FALSE)
cat("Exported", nrow(pbtx_events), "Puebla-Tlaxcala region events\n")

# Export regional event summary (Chiapas)
chiapas_events <- DBI::dbGetQuery(con, "
  SELECT e.*, egl.state, egl.nearest_grid_id
  FROM eventinfo AS e
  JOIN event_geo_location AS egl ON e.id = egl.event_id
  WHERE e.approved = 'yes'
    AND e.start_year BETWEEN 1578 AND 1706
    AND egl.state = 'Chiapas'
  ORDER BY e.start_year
")
write.csv(chiapas_events, "data_backup/chiapas_region_events_2026_01_21.csv", row.names = FALSE)
cat("Exported", nrow(chiapas_events), "Chiapas region events\n")

# Close connection
DBI::dbDisconnect(con)

cat("\nDatabase snapshot completed successfully!\n")
cat("All files saved to data_backup/ directory\n")
