#!/bin/bash
# $Id: pdf2eps,v 0.01 2005/10/28 00:55:46 Herbert Voss Exp $
# Convert PDF to encapsulated PostScript.
# usage:
# pdf2eps <pdf file>

if [[ $# -ne 1 ]]; then
	echo "Need a file name"
	exit 1
fi

fname=$(echo $1| awk -F . '{print $1}')

pdfcrop ${fname}.pdf > /dev/null
mv ${fname}.pdf ${fname}.pdf-original
pdftops -f 1 -l 1 -eps "${fname}-crop.pdf" > /dev/null
rm -f "${fname}-crop.pdf"
epspdf ${fname}-crop.eps ${fname}.pdf
rm -f ${fname}-crop.eps

exit 0


#if [[ $# -ne 1 ]]; then
#	echo "Need a file name"
#	exit 1
#fi
#
#
#fname=$1
#
#pdf2ps $fname ZZAA11.ps
#ps2epsi ZZAA11.ps ZZAA11.epsi
#epspdf ZZAA11.epsi ${fname}.pdf
#
#exit 0
