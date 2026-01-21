# Data Snapshot: Climate and Health in Colonial Mexico: A Spatio-Temporal Approach to Assessing the Role of Climate Change

## About

This repository contains a snapshot of data from the [Ecocrisis database](https://ecocrisis.net) and the Mexican Drought Atlas (Stahle et al. 2016) as used in the article:

> Skopyk, Brad. "Climate and Health in Colonial Mexico: A Spatio-Temporal Approach to Assessing the Role of Climate Change." *Dumbarton Oaks*, forthcoming (2026).

## Why This Backup Exists

The Ecocrisis database is a living, crowdsourced resource that continuously evolves as researchers contribute new historical crisis events. While this collaborative approach enriches the dataset over time, it means the database state changes. This snapshot preserves the exact data used in the published analysis, ensuring reproducibility and allowing readers to verify findings using the same data.

**Snapshot Date:** January 21, 2026

## Data Files

### Complete Tables

1. **eventinfo_approved_2026_01_21.csv** (2.7 MB)
   - All approved events from the Ecocrisis database
   - 3,795 events

2. **event_geo_location_2026_01_21.csv** (683 KB)
   - Geographic location data for all events
   - 4,708 event-location records

3. **mxda_data_2026_01_21.csv** (64 MB)
   - Complete Mexican Drought Atlas (MXDA) climate data
   - PDSI values and z-scores by gridpoint and year

### Regional Event Subsets (1578-1706)

4. **mx_region_events_2026_01_21.csv** (341 KB)
   - Events in Ciudad de México and Estado de México

5. **bajio_region_events_2026_01_21.csv** (33 KB)
   - Events in Guanajuato and Querétaro

6. **pbtx_region_events_2026_01_21.csv** (256 KB)
   - Events in Puebla and Tlaxcala

7. **chiapas_region_events_2026_01_21.csv** (30 KB)
   - Events in Chiapas

See [README.md](README.md) for complete documentation of the data export process.

## Citation

If you use this data, please cite both the original paper and this repository:

```
Skopyk, Brad. (2026). Data Snapshot: Climate and Health in Colonial Mexico: A Spatio-Temporal Approach to Assessing the Role of Climate Change [Data set]. GitHub. 
https://github.com/bds134/changing-climates-skopyk-data-backup
```

And cite the original data sources:

```
Ecocrisis Project. (2026). Ecocrisis Database. https://ecocrisis.net

Stahle, D. W., Cook, E. R., Burnette, D. J., Villanueva Diaz, J., Cerano Paredes, J., 
Burns, J. N., ... & Szejner, P. (2016). The Mexican Drought Atlas: Tree-ring 
reconstructions of the soil moisture balance during the late pre-Hispanic, colonial, 
and modern eras. Quaternary Science Reviews, 149, 34-60.
```

## Database Access

This data was exported from the Ecocrisis database on January 21, 2026. For database access, contact the Ecocrisis project administrators at [ecocrisis.net](https://ecocrisis.net).

## Reproducibility

The export script used to generate these files is available as `export_database_snapshot.R` in this repository.

## License

This work is licensed under CC0 1.0 Universal (Public Domain Dedication). While not legally required, we request that you cite this dataset using the citation above when using it in academic work.

## Contact

For questions about this data snapshot, please contact Brad Skopyk.

For questions about the Ecocrisis database, visit [ecocrisis.net](https://ecocrisis.net).
