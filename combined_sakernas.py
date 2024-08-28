import pandas as pd
import os
import numpy as np

# Get the current working directory
directory = os.getcwd()

dtype_dict = {
    'KODE_PROV': str,
    'KODE_KAB': str,
    'KODE_KEC': str,
    'KODE_DESA': str,
    'BS': str
}

# List to store DataFrames from each Excel file
dfs = []

# Read Excel files in the current directory that contain "Sakernas-" in the filename
for filename in os.listdir(directory):
    if filename.startswith('Sakernas') and (filename.endswith('.xlsx') or filename.endswith('.xls')):
        file_path = os.path.join(directory, filename)
        try:
            df = pd.read_excel(file_path, dtype=dtype_dict)
            print(f"Processing {filename}")
            print(f"Shape: {df.shape}")
            print(f"Columns: {df.columns.tolist()}")
            
            if df.empty:
                print(f"Warning: {filename} is empty.")
            elif 'Anomali' in df.columns:
                df['Anomali'] = df['Anomali'].fillna('')
                dfs.append(df)
                print(f"Added {filename} to processing list.")
            else:
                print(f"Warning: 'Anomali' column not found in {filename}. Skipping this file.")
        except Exception as e:
            print(f"Error processing {filename}: {str(e)}")
        
        print("\n")

if not dfs:
    print("No 'Sakernas-' Excel files with 'Anomali' column found in the current directory.")
else:
    # Combine all DataFrames
    combined_df = pd.concat(dfs, ignore_index=True)

    # Ensure 'Anomali' is not used as a grouping column
    group_columns = [col for col in combined_df.columns if col != 'Anomali']
    
    # Check if 'Anomali' column exists in the combined DataFrame
    if 'Anomali' in combined_df.columns:
        grouped = combined_df.groupby(group_columns)

        def combine_anomali(series):
            unique_values = [str(value).strip() for value in series.unique() if str(value).strip()]
            combined = ','.join(unique_values)
            # Remove any instances of multiple commas and strip leading/trailing commas
            while ',,' in combined:
                combined = combined.replace(',,', ',')
            return combined.strip(',')

        # Apply the combining function to each group
        result = grouped.agg({'Anomali': combine_anomali}).reset_index()
    else:
        print("Warning: 'Anomali' column not found in the combined data. Skipping aggregation.")
        result = combined_df

    result['IDBS'] = result['KODE_PROV'].astype(str) + result['KODE_KAB'].astype(str) + \
                 result['KODE_KEC'].astype(str) + result['KODE_DESA'].astype(str) + \
                 result['BS'].astype(str)
    
    print(result.head())

    other_df = pd.read_excel('spv.xlsx')
    print(other_df.head())

    final_result = pd.merge(result, other_df[['IDBS', 'PCL', 'PML']], on='IDBS', how='left')

    # Save the result to a new Excel file
    output_file = 'combined_Sakernas_result.xlsx'
    final_result.to_excel(output_file, index=False)

    print(f"Combined result saved to {output_file}")