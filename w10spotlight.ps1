Add-Type -Assembly System.Drawing

$targetFolder="C:\Users\$env:username\Pictures\Saved Pictures"
$srcfolder="$env:localappdata\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets"
#$srcfolder="c:\tmp"

$files=Get-ChildItem $srcfolder
foreach ( $file in $files )
{ 
  
  if ( $file.length -gt 50KB )
  { 
      $theFile=$file.FullName 
      write-host $theFile
      $image = [System.Drawing.Image]::FromFile( "$theFile" )
      if ( $image.width  -gt $image.height -and $image.width -gt 120)
      {
	    #write-host $file.BaseName" is for computer"
        Copy-Item $file.Fullname -dest  ($targetFolder +"\" + $file.BaseName + ".jpg" )
      }
  }
}