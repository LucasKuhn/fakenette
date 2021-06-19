for SRC in `find . -maxdepth 1 -iname 'c*' `
do
    DST=`dirname "${SRC}"`/`basename "${SRC}" | tr 'c' 'C' | sed 's/-tests//g'`
    if [ "${SRC}" != "${DST}" ]
    then
        [ ! -e "${DST}" ] && mv -T "${SRC}" "${DST}" || echo "${SRC} was not renamed"
    fi
done

for EX in `find . -iname 'ex*.c'`
do
    DIR=`echo $EX | sed 's/.c//'`
	mkdir --parents "$DIR";
done

for EX in `find . -iname 'ex*.c'`
do

    DIR=`echo $EX | sed 's/.c/\/main.c/'`
	mv "${EX}" "${DIR}"
done
