#!/bin/sh
while getopts "hrcx" ARGS; do
        case $ARGS in

		r)
			docker build -o ./build .
			flatpak run io.github.lime3ds.Lime3DS build/output.3dsx
                        exit 0
			;;
		c)
			rm -r ./build
			exit 0
			;;
		x)
			docker build -o ./build .
			flatpak run io.github.lime3ds.Lime3DS build/output.3dsx
			rm -r ./build
			exit 0
			;;
		h)
                        echo "Usage:"
                        echo "   -r     run build code after compilation"
                        echo "   -x     execute and then clean build files"
			echo "   -h     help (this output)"
                        exit 0
                        ;;
		?)
			exit 0
			;;

        esac
done
docker build -o ./build .
