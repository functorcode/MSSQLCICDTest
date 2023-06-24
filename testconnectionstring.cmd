$conn = New-Object System.Data.SqlClient.SqlConnection
$conn.ConnectionString = "Server=localhost\sqlexpress;Database=AdventureWorksTestEnv;User ID=cicdsqluser;Password=abc123;"
$conn.Open()
$sql = "SELECT * from [AdventureWorksTestEnv].[SalesLT].[Address]"
$cmd = New-Object System.Data.SqlClient.SqlCommand($sql,$conn)
$rdr = $cmd.ExecuteReader()
$test = @()
while($rdr.Read())
{
    $test += ($rdr["EMP_STATUS"].ToString())
}
Write-Output $test


- name: Deploy dacpac
              uses: azure/sql-action@v2.2
              with:
                 connection-string: "Server=localhost\\sqlexpress;Database=AdventureWorksTestEnv;User ID=cicdsqluser;Password=abc123;"
                 # Path to the dacpac file in the artifact
                 path: './MSSQLCICD.dacpac'
                 # Action we want it to do, in this case 'Publish' the contents of the dacpac to the database
                 action: 'publish'

                 Data Source=localhost\\sqlexpress;Persist Security Info=False;User ID=cicdsqluser;Pooling=False;Multiple Active Result Sets=False;Connect Timeout=60;Encrypt=False;Trust Server Certificate=False;Command Timeout=0