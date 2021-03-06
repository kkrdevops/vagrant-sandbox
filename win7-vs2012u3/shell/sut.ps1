
# This script msut be run in STA mode to avoid casting errors
# powershell.exe -STA
param ( [string] $User, [string] $ImagePath )

# Create the call to the User Tile API
[string] $SourceCode = @"
[DllImport("shell32.dll", EntryPoint = "#262", CharSet = CharSet.Unicode, PreserveSig = false)]
public static extern void SetUserTile(string username, int whatever, string picpath);
"@
$type = Add-Type -Namespace iammarkharrison -Name Tiles -MemberDefinition $SourceCode -PassThru

#Set the User Tile
[iammarkharrison.Tiles]::SetTile($User,$ImagePath)