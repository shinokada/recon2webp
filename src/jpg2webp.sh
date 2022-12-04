fn_jpg2webp(){
    check_cmd cwebp
    check_cmd convert

    # for each webp in the input directory
    for img in $( find ${INPUTDIR} -type f -iname "*.jpg" -o -iname "*.jpeg" );
    do
        # convert to png first
        convert "$img" "${img%.*}".png

        # then convert png to webp
        cwebp "${img%.*}".png -q "${QUALITY}" -o "${img%.*}".webp
    done
    bannerColor 'Completed converting from jpg to webp.' "green" "*"

    if [ ${OUTPUTDIR} ];then
        bannerColor "Moving converted files to ${OUTPUTDIR} ... " "blue" "*"
        mkdir -p ${OUTPUTDIR} && mv *.webp "${OUTPUTDIR}"
        bannerColor "Moved all the files to ${OUTPUTDIR}." "green" "*"
    fi
}