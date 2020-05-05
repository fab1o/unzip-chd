# unzip-chd
Auto extracts zipped CHDs into your mame roms folder correctly.

It's an automation script that follows this process: [How to Get CHD Files to Work With MAME]()

## Requirements

-  Windows 10 (for now)(you may try a previous version, I haven't tested it)
-  7-zip - you can download at 7-zip.org (located in your C:\Program Files\7-Zip, but you can change that in the script).
-  CHD zipped files, like the series of 0.221 CHD mame files for example from archive.org
-  This script - Download the script. Make sure it is located in the same folder where you downloaded all the zipped CHD files. Also, make sure there's no other .7z file that is not a CHD in this folder.

There's two ways to run the script:

### 1st way

1. Right-click on the script file, choose Edit or Open / Notepad (whatever works).
2. Change the $Destination to your own roms folder in mame. Save the file and close the editor.
3. Right-click on it again, and choose Run with PowerShell.

### Another way

1. Hit the Windows key in your keyboard and type: powershell then hit enter.
2. Once in Powershell, go to the folder where you downloaded the script with the CHD zipped files by typing: `cd "<your folder>"`
  - (for example: `cd "C:\Users\Admin\Downloads"`) 
3. Then execute the script by typing: `.\unzip_chd.ps1  -Destination "<your roms path folder>"`
  - (path where your roms folder is located, for example: `.\unzip_chd.ps1  -Destination "C:\MAME\roms"`)
4. If you receive an error message `"File...cannot be loaded because running scripts is disabled on this system..."`, do this:
5. Type: Set-ExecutionPolicy ByPass -Scope Process then type Y and hit enter. (This will be undone once you close Powershell)
6. Now type: `.\unzip_chd.ps1  -Destination "<your roms path folder>"`

### Observations

__I'm NOT the author of CHD zipped files you may download online.__

This script will unzip .7z files into the roms folder in mame (the one you typed in the script or command line) into their respective folders, enabling CHDs to work correctly.

If you downloaded CHD files that are not zipped with 7zip but with another extension (like .zip) then all you need to do is add `-ext "zip"` to the command:

```powershell
.\unzip_chd.ps1  -Destination "<your roms path folder>" -ext "zip"
```

The script will delete each zipped file once everything is done. If for any reason you want to keep the original zipped files, remove line 19 from the script.

### Future

-  A version 2 of this script will be to read the roms you have in your roms folder in mame, find out if you don't have their respective CHD yet, and automatically download them. If anybody wants to help with this project, feel free to join me.
-  Linux and Mac upcoming.
