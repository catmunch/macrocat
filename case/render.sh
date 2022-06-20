#!/bin/bash

if ! command -v openscad &> /dev/null
then
	echo "Openscad binary not found, please install first"
	exit
fi

if ! command -v sed &> /dev/null
then
	echo "Sed binary not found, please install first"
	exit
fi

mkdir -p "export"

echo "Compiling top case"
sed '2s/preview/top/' main.scad | openscad - --export-format asciistl -o "top case.stl"
mv "top case.stl" "export"

echo "========================"
echo "Compiling bottom case"
sed '2s/preview/bottom/' main.scad | openscad - --export-format asciistl -o "bottom case.stl"
mv "bottom case.stl" "export"

echo "========================"
echo "Compiling plate"
sed '2s/preview/plate/' main.scad | openscad - -o "plate.dxf"
mv "plate.dxf" "export"

echo "========================"
echo "Done"
