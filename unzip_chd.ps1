param (
    [string]$Destination = "C:\MAME\roms",
    [string]$ext = "7z"
)

$Source = ".\"

$File_Match = ($ext | ForEach-Object { "\.$_$" }) -join '|'

Get-ChildItem $Source |
    Where-Object { $_ -imatch $File_Match } |
    ForEach-Object {
        $ThisDest = "$Destination\$($_.BaseName)"
        if ( -not (Test-Path $ThisDest) ) {
            New-Item -ItemType "directory" $ThisDest -Force
        }
        & "C:\Program Files\7-Zip\7z.exe" "x" "-y" $_.fullname "-o$ThisDest"
        & Remove-Item $_.fullname -Recurse -Force -Confirm:$false
    }
