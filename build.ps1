# Generate PNG icons from SVGs
dir -recurse Icons/**/*.svg | Foreach { ./convert $_.FullName -resize 32x32 -density 96x96 "PNGIcons/$($_.BaseName)_32.png" }
dir -recurse Icons/**/*.svg | Foreach { ./convert -density 192 $_.FullName "PNGIcons/$($_.BaseName)_64.png" }

# Build XML to CDCOM
& $env:cdcompile -i Components -o Build --icondir PNGIcons -r -v --manifest Build/manifest.xml --preview Preview

exit $LASTEXITCODE
