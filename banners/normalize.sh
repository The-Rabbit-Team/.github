#!/bin/sh

HEIGHT=320
WIDTH=640
THETA=30

# Créer un masque avec avec des coins arrondis
convert -size 640x320 xc:none -draw "roundrectangle 0,0,$WIDTH,$HEIGHT,$THETA,$THETA" mask.png

# Pour chaque bannière, redimensionner en 640x320 pixels et appliquer le masque
for file in *.png; do
    convert "$file" -resize "${WIDTH}x${HEIGHT}" -matte mask.png -compose DstIn -composite "$file"
done

# Supprimer le fichier masque utilisé
rm mask.png

exit 0
