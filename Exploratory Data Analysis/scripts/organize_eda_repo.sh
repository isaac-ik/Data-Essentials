#!/bin/bash

set -e

SCRIPTS_DIR="$HOME/Projects/SQL/EDA/Exploratory Data Analysis/scripts"

echo "Organizing EDA scripts in:"
echo "$SCRIPTS_DIR"
echo

cd "$SCRIPTS_DIR"

# Create subfolders inside scripts/
mkdir -p 00_setup 01_data_exploration 02_measures 03_magnitude 04_ranking assets

echo "Moving setup scripts..."
mv S1_setup_Database.sql 00_setup/ 2>/dev/null || true
mv S2_create_schema.sql 00_setup/ 2>/dev/null || true
mv S2_1_create_schema_for_gold.sql 00_setup/ 2>/dev/null || true
mv S3_create_tables.sql 00_setup/ 2>/dev/null || true
mv S3_1_create_table_for_gold.sql 00_setup/ 2>/dev/null || true
mv S4_load_gold.sql 00_setup/ 2>/dev/null || true

echo "Moving data exploration..."
mv "Data Exploration.sql" 01_data_exploration/Data_Exploration.sql 2>/dev/null || true

echo "Moving measures..."
mv "3 Measures.sql" 02_measures/Measures.sql 2>/dev/null || true
mv "3.Measures.sql" 02_measures/Measures.sql 2>/dev/null || true

echo "Moving magnitude analysis..."
mv "4 Magnitude.sql" 03_magnitude/Magnitude.sql 2>/dev/null || true

echo "Moving ranking analysis..."
mv "5 Ranking.sql" 04_ranking/Ranking.sql 2>/dev/null || true

echo "Moving assets..."
mv explain_plan_*.svg assets/ 2>/dev/null || true

echo
echo "Scripts organized successfully."

