1. The Test Suite implemented within the file vehicle_data_entry.robot has been performed applying the Data Driven Testing method.

2. The Test Data for each Test Case are collected in a csv file at tricentis-vehicle-insurance-sample-app/data/automobile_data_entry_page/vehicle_data/vehicle_data.csv.

3. The Test Data have been gathered by applying EP and 2-BVA:
    - Make selection: Selection/No Selection
    - Eng. performance: [-inf.. 2000]/[1.. 2000]/[2000.. +inf]; Not a Number; No Entry
    - Date of Manufacture: Valid Date/Invalid Date(DD)/Invalid Date(MM)/Invalid Date(YYYY)
    - Number of Seats: Selection/No Selection
    - Fuel Type: Selection/No Selection
    - List price: [-inf.. 499]/[500.. 100000]/[100001.. +inf]; Not a Number; No Entry
    - Lic. Plate: Optional (skipped for semplicity)
    - Annual Mileage: [-inf.. 99]/[100.. 100000]/[100001.. +inf]; Not a Number; No Entry

4. The Test Cases have been designed from the Test Data with the objective to combine them to avoid redundancy and reach 100% EP and 2-BVA coverage. Totally 2 Test Cases to exercise all the valid partitions and 3 Test Cases to exercise all the invalid partitions.