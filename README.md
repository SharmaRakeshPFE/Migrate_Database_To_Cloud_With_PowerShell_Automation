# Export_Bacpac_Automation
# Important:-    Test the solution thoroughly before trying it on Production 
# Description:-  The solution will Export\BACPAC multiple databases from multiple servers and store in individual directories by the name of the target servers.
# Used Case:-        The solution can be used during migration project\Taking Adhoc Backup for databases for restoration on DEV\QA
# How to Use:-
1. Download the latest Microsoft® SQL Server® Data-Tier Application Framework (16.4)  - SQLPackage.exe https://www.microsoft.com/en-us/download/details.aspx?id=53876
    https://docs.microsoft.com/en-us/sql/tools/sqlpackage/sqlpackage?view=sql-server-ver15#import-parameters-and-properties
2. Create a batch file with below parameters and ensure correct location of sqlpackage.exe
    "C:\Program Files (x86)\Microsoft SQL Server\140\DAC\bin\sqlpackage.exe" /a:Export /SourceServerName:%1 /SourceDatabaseName:%2 /SourceUser:%3 /SourcePassword:%4 /TargetFile:%5      >>C:\Bacpac\SqlPackage\log\Exporta.Log
3.  To connect to Azure SQL Database from behind a corporate firewall, the firewall must have port 1433 open. To connect to SQL Managed Instance, you must have a point-to-site     connection or an express route connection.
4.  Ensure the destination servers are reachable from the Machine where we are running this solution
5.  Create a database and associated objects from the attached scripts
6.  If necessary change the database name but make sure corresponding changes must be done in the scripts
7.  TBL_Credential is the key table which script will read to connect to remote servers ensure credentials to connect to servers are stored correctly and for additionaly security DMM\TDE\Always Encrypted can be used.
8.  Run the Powershell Script Export_BACPAC_All_Databases
9.  Solution can be further modified if you want the BACPAC for specified databases
10.  Script will take bacpac in the folder C:\Bacpac\SqlPackage\files and update the tables with the location,time taken and size of databases

# Import_Bacpac_Automation

1. Import_Bacpac_AllDB.ps1 script will restore the databases on the remote server
2. Script will read the list of databases to restore from the table [TBL_BACPAC_LOCATIONS]
3. Script will read the credentail to connect to remote server and perform the restore of bacpac
4. After restoration the script will check the status
4. Create a batch file with below parameters and ensure correct location of sqlpackage.exe "C:\Program Files (x86)\Microsoft SQL Server\140\DAC\bin\sqlpackage.exe" /a:Import /sf:%1 /tsn:%2 /tdn:%3 /tu:%4 /tp:%5 >>C:\Infosys\SqlPackage\log\Import.Log
